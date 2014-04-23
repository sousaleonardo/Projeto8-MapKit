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

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        Atracoes *anotacaoDaAtracao = self.annotation;
        switch (anotacaoDaAtracao.tipoDeAtracao) {
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
    }
    
    return self;
}

@end
