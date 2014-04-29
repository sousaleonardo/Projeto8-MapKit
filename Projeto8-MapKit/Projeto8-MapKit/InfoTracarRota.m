//
//  InfoTracarRota.m
//  Projeto8-MapKit
//
//  Created by LEONARDO DE SOUSA MENDES on 28/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "InfoTracarRota.h"

@implementation InfoTracarRota

@synthesize pontosGanhos,distanciaKM;


- (id)initInfoRota:(CGRect)frame :(int)distancia :(int)pontos
{
    self = [super initWithFrame:frame];
    if (self) {
        self.distanciaKM = distancia;
        self.pontosGanhos = pontos;
    }
    return self;
}

@end
