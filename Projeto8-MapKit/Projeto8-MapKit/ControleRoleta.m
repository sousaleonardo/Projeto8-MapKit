//
//  ControleRoleta.m
//  Projeto8-MapKit
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 17/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ControleRoleta.h"

//Método privado de desenhar a roleta - TODO
@interface ControleRoleta()
-(void)desenhaRoleta;
@end

@implementation ControleRoleta

@synthesize delegate, container, numeroDeCategorias;

-(id)initWithFrame:(CGRect)frame andDelegate:(id)delegate withSections:(int)numeroDeCategorias
{
    //chama o super init
    if(self = [super initWithFrame:frame])
    {
        //define as propriedades
        self.numeroDeCategorias = numeroDeCategorias;
        self.delegate = delegate;
        
        //desenha a roleta
        [self desenhaRoleta];
    }
    return self;
}

-(void)desenhaRoleta
{
    
}

@end
