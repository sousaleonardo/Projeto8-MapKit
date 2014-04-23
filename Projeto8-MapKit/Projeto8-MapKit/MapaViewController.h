//
//  MapaViewController.h
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 21/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface MapaViewController : ViewController 
{
    int categoriaSelecionada;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
