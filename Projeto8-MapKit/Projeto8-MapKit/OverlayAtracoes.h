//
//  OverlayAtracoes.h
//  Projeto8-MapKit
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 22/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Atracoes.h"

@interface OverlayAtracoes : MKAnnotationView
{
    SEL mostrarInfo;
    SEL calcularRota;
    id Target;
}
@property Atracoes * anotacaoDaAtracao;
- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier :(id)Target : (SEL)seletor : (SEL)seletor2;
@end
