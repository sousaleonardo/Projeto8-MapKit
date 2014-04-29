//
//  MapaViewController.m
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 21/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "MapaViewController.h"


@interface MapaViewController ()

@end

@implementation MapaViewController

-(void)verifandoSeIraGanharPontos{
    CFTimeInterval startTime = CACurrentMediaTime();
    CFTimeInterval elapsedTime;

    while ([self.mapView.userLocation.location distanceFromLocation:self.destino.placemark.location] < 7000) {
        
        elapsedTime = CACurrentMediaTime() - startTime;
        if (elapsedTime >10) {
            break;
        }
    }
  
    elapsedTime = CACurrentMediaTime() - startTime;
    if ( elapsedTime >= 10) {
        [self performSelectorOnMainThread:@selector(mandarPontos) withObject:nil waitUntilDone:YES];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.showsUserLocation = YES;
    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addAttractionPins {
    
    Lugares *todasAtracoes = [Lugares sharedLugares];
    
    NSDictionary *atracoes = [[todasAtracoes objectForKey:@"Categoria"]objectAtIndex:self->categoriaSelecionada];
        
    for (int i = 0; i < [[atracoes objectForKey:@"Lugares"]count]; i++) {
        NSDictionary *lugar = [[atracoes objectForKey:@"Lugares"]objectAtIndex:i];
        Atracoes *annotation = [[Atracoes alloc] init];
        CGPoint point = CGPointMake([[lugar objectForKey:@"Latitude"]doubleValue],[[lugar objectForKey:@"Longitude"]doubleValue] );
        annotation.coordinate = CLLocationCoordinate2DMake(point.x, point.y);
        annotation.title = [lugar objectForKey:@"Nome"];
        annotation.tipoDeAtracao = self->categoriaSelecionada;
        annotation.descricao = [lugar objectForKey:@"Descricao"];
        annotation.endereco = [lugar objectForKey:@"Endereco"];
        annotation.pontos = [[[[todasAtracoes objectForKey:@"Categoria"]objectAtIndex:self->categoriaSelecionada]objectForKey:@"Pontos"]integerValue];
        annotation.subtitle = [lugar objectForKey:@"Preco"];
        
        
        [self.mapView addAnnotation:annotation];
    }
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[Atracoes class]]) {
        OverlayAtracoes *viewAtracao = [[OverlayAtracoes alloc] initWithAnnotation:annotation reuseIdentifier:@"Atraction" :self :@selector(verInformacoes:) :@selector(calcularRota:)];
        viewAtracao.canShowCallout = YES;
        return viewAtracao;
    }
   
    return nil;
}
-(void)verInformacoes : (Atracoes*)atracao{
    
    self->atracaoSelecionada = atracao;
   
    [self performSegueWithIdentifier:@"mostrarInfo" sender:self];

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"mostrarInfo"])
    {
        InformacoesViewController *info =  [segue destinationViewController];
        [info setAtracao:self->atracaoSelecionada];
        
    }
}
- (void)calcularRota:(Atracoes*)atracaoDestino
{
    
    self->pontosGanhos +=atracaoDestino.pontos;
    
    MKPlacemark *placeInicio = [[MKPlacemark alloc] initWithCoordinate:[[[self mapView] userLocation] coordinate] addressDictionary:nil];
    
    self.inicio = [[MKMapItem alloc] initWithPlacemark:placeInicio];
    
    MKPlacemark *placeDestino = [[MKPlacemark alloc] initWithCoordinate:atracaoDestino.coordinate addressDictionary:Nil];
    
    self.destino = [[MKMapItem alloc] initWithPlacemark:placeDestino];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    [request setSource:self.inicio];
    [request setDestination:self.destino];
    [request setRequestsAlternateRoutes:NO];
    
    CLLocation *localizacaoDestino = [[CLLocation alloc] initWithLatitude:atracaoDestino.coordinate.latitude longitude:atracaoDestino.coordinate.longitude];
    double distanceMeters = [self.mapView.userLocation.location distanceFromLocation:localizacaoDestino];
    double distaciaEmKM = distanceMeters/1000;
        
        if (distaciaEmKM <= 5) {
            self->pontosGanhos +=25;
        }
        else if (distaciaEmKM <= 10) {
            self->pontosGanhos +=50;
        }
        else if (distaciaEmKM <= 15) {
            self->pontosGanhos +=75;
        }
        else if (distaciaEmKM >=20) {
            self->pontosGanhos +=100;
        }
        
    
    MKDirections *direcoes = [[MKDirections alloc] initWithRequest:request];
    [direcoes calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error)
     {
         if (error)
         {
             NSLog(@"Erro ao traçar caminho");
         }else
         {
             [self mostraRota:response];
         }
     }];


    if (self.destino != nil && [self.mapView.userLocation.location distanceFromLocation:self.destino.placemark.location] < 7000) {
        self.verifandoLugar = [[NSThread alloc]initWithTarget:self selector:@selector(verifandoSeIraGanharPontos) object:nil];
        [self.verifandoLugar start];
        
    }
    if (self.inicio !=nil && self.destino != nil) {
        self.inicio = nil;
        self.destino = nil;
        [self.mapView removeOverlays:self.mapView.overlays];
    }
}
- (IBAction)mudarCategoria:(id)sender {
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    self->categoriaSelecionada = [sender tag];
    [self addAttractionPins];
    
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    self.renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    [[self renderer] setStrokeColor:[UIColor blueColor]];
    [[self renderer] setLineWidth:5.0];
    
    return [self renderer];
}

- (void)mostraRota:(MKDirectionsResponse *)response
{
    for (MKRoute *rota in response.routes)
    {
        [[self mapView] addOverlay:rota.polyline level:MKOverlayLevelAboveRoads];
    }
}
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // Centraliza o mapa ao redor da posição atual do usuário
    [[self mapView] setCenterCoordinate:[[userLocation location] coordinate] animated:YES];
    
    
    // Dá um zoom na região atual do usuário
    self.mapView.region = MKCoordinateRegionMake(userLocation.location.coordinate, MKCoordinateSpanMake(0.1, 0.1));
    
    self.localizacaoAtual = userLocation.location.coordinate;
    if (self.destino != nil && [self.mapView.userLocation.location distanceFromLocation:self.destino.placemark.location] < 7000) {
        self.verifandoLugar = [[NSThread alloc]initWithTarget:self selector:@selector(verifandoSeIraGanharPontos) object:nil];
        [self.verifandoLugar start];
    }
}
-(void)mandarPontos {
    
    //Salva o lugar usando o DadosUser
    NSString *nomeAtracao=[self->atracaoSelecionada title];
    NSString *categoriaAtracao = [[NSString alloc]init];
    switch (self->categoriaSelecionada) {
        case 0:
            categoriaAtracao = @"Parque";
            break;
        case 1:
            categoriaAtracao = @"Pracas";
            break;
        case 2:
            categoriaAtracao = @"Museus";
            break;
        case 3:
            categoriaAtracao = @"Teatro";
            break;
        case 4:
            categoriaAtracao = @"Zoologicos";
            break;
        case 5:
            categoriaAtracao = @"Biblioteca";
            break;
        case 6:
            categoriaAtracao = @"Espacos Culturais";
            break;
        case 7:
            categoriaAtracao = @"Edificios Religiosos";
            break;
        case 8:
            categoriaAtracao = @"Igrejas";
            break;
        case 9:
            categoriaAtracao = @"Outros";
            break;
            
        default:
            break;
    }
   
    
    [DadosUser processarIaMedalha:nomeAtracao :categoriaAtracao];
    
    [FBRequestConnection startWithGraphPath:@"me/scores"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error) {
         if (error) {
             UIAlertView *erro = [[UIAlertView alloc]initWithTitle:@"Erro" message:@"Nao foi Possivel Enviar seus pontos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
             [erro show];
         }
         else{
             int pontosAtuais =[[[[result objectForKey:@"data"]objectAtIndex:0]objectForKey:@"score"]intValue];
             
             
             NSDictionary *pontosEnviar = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",self->pontosGanhos+ pontosAtuais],@"score",nil];
             
             [FBRequestConnection startWithGraphPath:@"me/scores"
                                          parameters:pontosEnviar
                                          HTTPMethod:@"POST"
                                   completionHandler:
              ^(FBRequestConnection *connection, id result, NSError *error) {
                  if (error) {
                      UIAlertView *erro = [[UIAlertView alloc]initWithTitle:@"Erro" message:@"Nao foi Possivel Enviar seus pontos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                      [erro show];
                  }
                  else{
                      NSString *mensagem = [NSString stringWithFormat:@"Você ganhou %d Pontos",self->pontosGanhos];
                      UIAlertView *ganhouPontos = [[UIAlertView alloc]initWithTitle:@"Parabéns!" message:mensagem delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                      [ganhouPontos show];
                      
                  }
                  
              }];
             
         }
         
     }];
}

     

@end
