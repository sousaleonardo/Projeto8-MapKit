//
//  MapaViewController.h
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 21/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "InformacoesViewController.h"
#import "Atracoes.h"
#import "OverlayAtracoes.h"
#import "Lugares.h"

@interface MapaViewController : ViewController <MKMapViewDelegate>
{
    NSInteger categoriaSelecionada;
    Atracoes *atracaoSelecionada;
    int pontosGanhos;
}
@property CLLocationCoordinate2D localizacaoAtual;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property MKMapItem *inicio;
@property MKMapItem *destino;
@property MKPolylineRenderer * renderer;
@property NSThread *verifandoLugar;





@end
