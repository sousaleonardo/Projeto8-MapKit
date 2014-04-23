//
//  MapaViewController.m
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 21/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "MapaViewController.h"
#import "Atracoes.h"
#import "OverlayAtracoes.h"
#import "Lugares.h"

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
        annotation.subtitle = [lugar objectForKey:@"Preco"];
        
        
        [self.mapView addAnnotation:annotation];
    }
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
   OverlayAtracoes *viewAtracao = [[OverlayAtracoes alloc] initWithAnnotation:annotation reuseIdentifier:@"Atraction" :self :@selector(verInformacoes:) :nil ];
    viewAtracao.canShowCallout = YES;
    return viewAtracao;
}
-(void)verInformacoes {
    
    [self performSegueWithIdentifier:@"ParaInformacoes" sender:nil];

}


@end
