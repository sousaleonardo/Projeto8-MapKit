//
//  OverlayAtracoes.m
//  Projeto8-MapKit
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 22/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "OverlayAtracoes.h"
#import "Atracoes.h"

@implementation OverlayAtracoes

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier :(id)target : (SEL)seletor : (SEL)seletor2 {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.anotacaoDaAtracao = self.annotation;
        switch (self.anotacaoDaAtracao.tipoDeAtracao) {
            case Parque:
                self.image = [UIImage imageNamed:@"firstaid"];
                break;
            case Pracas:
                self.image = [UIImage imageNamed:@"food"];
                break;
            case Museus:
                self.image = [UIImage imageNamed:@"ride"];
                break;
            case Teatro:
                self.image = [UIImage imageNamed:@"firstaid"];
                break;
            case Zoologicos:
                self.image = [UIImage imageNamed:@"food"];
                break;
            case Biblioteca:
                self.image = [UIImage imageNamed:@"ride"];
                break;
            case EspacosCulturais:
                self.image = [UIImage imageNamed:@"firstaid"];
                break;
            case EdificiosReligiosos:
                self.image = [UIImage imageNamed:@"firstaid"];
                break;
            default:
                self.image = [UIImage imageNamed:@"star"];
                break;
        }
        
        
        
        UIButton * botaoInfo = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        UIButton *botaoRota = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [botaoRota setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
        [botaoRota setTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"star"]]];
        
        [botaoRota addTarget:self action:@selector(rota) forControlEvents:UIControlEventTouchDown];
        [botaoInfo addTarget:self action:@selector(mostrarInfo) forControlEvents:UIControlEventTouchDown];
        self->mostrarInfo = seletor;
        self->calcularRota = seletor2;
        self->Target = target;
        self.leftCalloutAccessoryView = botaoRota;
        
        self.rightCalloutAccessoryView = botaoInfo;
    }
    
    return self;
}

-(void)rota{
    if ([Target respondsToSelector:self->calcularRota]) {
        [Target performSelector:self->calcularRota withObject:self.anotacaoDaAtracao];
    }
}
-(void)mostrarInfo{
    if ([Target respondsToSelector:self->mostrarInfo]) {
        [Target performSelector:self->mostrarInfo withObject:self.anotacaoDaAtracao];
    }
}

@end
