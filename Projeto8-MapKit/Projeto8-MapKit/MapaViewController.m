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

@interface MapaViewController ()

@end

@implementation MapaViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addAttractionPins];
    self->categoriaSelecionada = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addAttractionPins {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DadosLocais" ofType:@"plist"];
    NSDictionary *attractions = [NSArray arrayWithContentsOfFile:filePath];
    
    NSDictionary *atracoes = [[attractions objectForKey:@"Categoria"]objectAtIndex:self->categoriaSelecionada];
    
    for (int i = 0; i < [[atracoes objectForKey:@"Lugares"]count]; i++) {
        NSDictionary *lugar = [[atracoes objectForKey:@"Lugares"]objectAtIndex:i];
        Atracoes *annotation = [[Atracoes alloc] init];
        CGPoint point = CGPointMake([[lugar objectForKey:@"Latitude"]doubleValue],[[lugar objectForKey:@"Longitude"]doubleValue] );
        annotation.coordinate = CLLocationCoordinate2DMake(point.x, point.y);
        annotation.nomeLocal = [lugar objectForKey:@"Nome"];
        annotation.tipoDeAtracao = self->categoriaSelecionada+1;
        annotation.descricaoLocal = [lugar objectForKey:@"Descricao"];
        [self.mapView addAnnotation:annotation];
    }
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
   OverlayAtracoes *viewAtracao = [[OverlayAtracoes alloc] initWithAnnotation:annotation reuseIdentifier:@"Attraction"];
    viewAtracao.canShowCallout = YES;
    return viewAtracao;
}



@end
