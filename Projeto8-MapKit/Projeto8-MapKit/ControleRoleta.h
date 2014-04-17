//
//  ControleRoleta.h
//  Projeto8-MapKit
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 17/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "RoletaProtocol.h"

@interface ControleRoleta : UIControl

@property (weak) id <RoletaProtocol> delegate; //Avisa quando o usuário seleciona uma categoria
@property (nonatomic, strong) UIView *container; //Contém a roleta
@property int numeroDeCategorias; //Número de categorias que a roleta terá

//Inicia um frame com um delegate e com o numero de categorias
//O método será chamado pelo view controler da roleta para inicializá-la
-(id) initWithFrame:(CGRect)frame andDelegate:(id)delegate withSections:(int)numeroDeCategorias;

@end
