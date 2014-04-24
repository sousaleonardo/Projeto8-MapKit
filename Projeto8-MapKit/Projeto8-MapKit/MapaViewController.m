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



- (void)viewDidLoad
{
    [super viewDidLoad];
    self->categoriaSelecionada = 2;
    [self addAttractionPins];
    
    
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
        annotation.tipoDeAtracao = self->categoriaSelecionada+1;
        annotation.descricao = [lugar objectForKey:@"Descricao"];
        annotation.endereco = [lugar objectForKey:@"Endereco"];
        
        annotation.subtitle = [lugar objectForKey:@"Preco"];
        
        
        [self.mapView addAnnotation:annotation];
    }
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    OverlayAtracoes *viewAtracao = [[OverlayAtracoes alloc] initWithAnnotation:annotation reuseIdentifier:@"Atraction" :self :@selector(verInformacoes:) :nil ];
    viewAtracao.canShowCallout = YES;
    return viewAtracao;
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
- (void)calcularRota:(CLLocationCoordinate2D)coordenadaDestino
{
    
    MKPlacemark *placeInicio = [[MKPlacemark alloc] initWithCoordinate:[[[self mapView] userLocation] coordinate] addressDictionary:nil];
    
    MKMapItem *inicio = [[MKMapItem alloc] initWithPlacemark:placeInicio];
    
    MKPlacemark *placeDestino = [[MKPlacemark alloc] initWithCoordinate:coordenadaDestino addressDictionary:Nil];
    
    MKMapItem *destino = [[MKMapItem alloc] initWithPlacemark:placeDestino];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    [request setSource:inicio];
    [request setDestination:destino];
    [request setRequestsAlternateRoutes:NO];
    
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
}

- (void)mostraRota:(MKDirectionsResponse *)response
{
    for (MKRoute *rota in response.routes)
    {
        [[self mapView] addOverlay:rota.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in rota.steps)
        {
            NSLog(@"%@", step.instructions);
        }
    }
}
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // Centraliza o mapa ao redor da posição atual do usuário
    [[self mapView] setCenterCoordinate:[[userLocation location] coordinate] animated:YES];
    
    // Dá um zoom na região atual do usuário
    self.mapView.region = MKCoordinateRegionMake(userLocation.location.coordinate, MKCoordinateSpanMake(0.1, 0.1));
    
    self.localizacaoAtual = userLocation.location.coordinate;
    
    
}

     

@end
