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

@property CGFloat tamanhoAngulo; //Tamanho do ângulo de cada categoria. Cálculo --> 2*PI / numeroDeCategorias

//Quando o usuário toca na roleta...
@property CGAffineTransform transformacaoInicial; //salva a transformação inicial
@property float deltaAngulo; //salva o ângulo inicial


//Inicia um frame com um delegate e com o número de categorias
//O método será chamado pelo view controler da roleta para inicializar
-(id) initWithFrame:(CGRect)frame andDelegate:(id)delegate withSections:(int)numeroDeCategorias;

//Método para desenhar a roleta com o numero de categorias passado
-(void)desenhaRoleta;

//Método para fazer a roleta rodar apenas nos pontos definidos - por categoria
-(void)rodar;


@end
