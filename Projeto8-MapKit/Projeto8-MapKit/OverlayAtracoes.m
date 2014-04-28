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
                self.image = [UIImage imageNamed:@"0_parques.png"];
                break;
            case Pracas:
                self.image = [UIImage imageNamed:@"1_pracas.png"];
                break;
            case Museus:
                self.image = [UIImage imageNamed:@"2_museus.png"];
                break;
            case Teatro:
                self.image = [UIImage imageNamed:@"3_teatros.png"];
                break;
            case Zoologicos:
                self.image = [UIImage imageNamed:@"4_zoologicos.png"];
                break;
            case Biblioteca:
                self.image = [UIImage imageNamed:@"5_bibliotecas.png"];
                break;
            case EspacosCulturais:
                self.image = [UIImage imageNamed:@"6_centrosCulturais.png"];
                break;
            case EdificiosReligiosos:
                self.image = [UIImage imageNamed:@"7_edificiosHistoricos.png"];
                break;
            case Igrejas:
                self.image = [UIImage imageNamed:@"8_igrejas"];
                break;
            case Outros:
                self.image = [UIImage imageNamed:@"9_outros.png"];
                break;
            default:
                break;
        }
        
        
        
        UIButton * botaoInfo = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [botaoInfo setImage:[UIImage imageNamed:@"informacoes"] forState:UIControlStateNormal];
        [botaoInfo setTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"informacoes"]]];
        
        UIButton *botaoRota = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [botaoRota setImage:[UIImage imageNamed:@"rotas"] forState:UIControlStateNormal];
        [botaoRota setTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rotas"]]];
        
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
