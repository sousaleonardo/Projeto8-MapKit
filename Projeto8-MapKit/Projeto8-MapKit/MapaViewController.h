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
    int categoriaSelecionada;
    Atracoes *atracaoSelecionada;
    int pontosGanhos;
}
@property CLLocationCoordinate2D localizacaoAtual;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property MKMapItem *inicio;
@property MKMapItem *destino;
@property MKPolylineRenderer * renderer;
@property NSThread *verifandoLugar;

@property (strong, nonatomic) IBOutlet UIButton *btn0;
@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn3;
@property (strong, nonatomic) IBOutlet UIButton *btn4;
@property (strong, nonatomic) IBOutlet UIButton *btn5;
@property (strong, nonatomic) IBOutlet UIButton *btn6;
@property (strong, nonatomic) IBOutlet UIButton *btn7;
@property (strong, nonatomic) IBOutlet UIButton *btn8;
@property (strong, nonatomic) IBOutlet UIButton *btn9;



@end
