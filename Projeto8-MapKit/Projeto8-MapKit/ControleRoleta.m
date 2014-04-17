//
//  ControleRoleta.m
//  Projeto8-MapKit
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 17/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//  http://www.raywenderlich.com/9864/how-to-create-a-rotating-wheel-control-with-uikit

#import "ControleRoleta.h"

//Método privado de desenhar a roleta
@interface ControleRoleta()
-(void)desenhaRoleta;
@end

@implementation ControleRoleta

@synthesize delegate, container, numeroDeCategorias;

//Coloquei "Var" no final de cada variável usada para difenciar dos atributos
-(id)initWithFrame:(CGRect)frameVar andDelegate:(id)delegateVar withSections:(int)numeroDeCategoriasVar
{
    //chama o super init
    if(self = [super initWithFrame:frameVar])
    {
        //define as propriedades
        self.numeroDeCategorias = numeroDeCategoriasVar;
        self.delegate = delegateVar;
        
        //desenha a roleta
        [self desenhaRoleta];
    }
    return self;
}

-(void)desenhaRoleta
{
    //Cria a view que conterá a roleta
    container = [[UIView alloc] initWithFrame:self.frame];
    
    //Em um círculo temos 2*PI radianos(razão entre o comprimento de um arco e o seu raio)
    //Dividindo pelo numero de categorias, temos o tamanho a que cada categoria pertence
    CGFloat tamanhoAngulo = 2 * M_PI / numeroDeCategorias;
    
    //Para cada categoria, é criado um label e o "Anchor Point" é colocado na posição(1.0f, 0.5f)
    //Anchor Point é o centro do layer, assim, quando for rotacionado, ele irá girar em volta desse ponto
    for(int i = 0; i < numeroDeCategorias; i++)
    {
        UILabel *lblCategoria = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        
        lblCategoria.backgroundColor = [UIColor redColor]; //Será substituido mais tarde pela imagem
        lblCategoria.text = [NSString stringWithFormat:@"%i", i]; //Será substituido mais tarde pela imagem
        lblCategoria.layer.anchorPoint = CGPointMake(1.0f, 0.5f); //Define a "âncora" da label
        
        lblCategoria.layer.position = CGPointMake(container.bounds.size.width/2.0, container.bounds.size.height/2.0); //Define o tamanho
        lblCategoria.transform = CGAffineTransformMakeRotation(tamanhoAngulo * i); //Gira a label para ficar ao lado da última criada
        lblCategoria.tag = i; //Define a tag como o numero atual da categoria
        
        //Adiciona a label recém-criada ao container
        [container addSubview:lblCategoria];
    }
    
    //Adiciona o container no controle
    container.userInteractionEnabled = NO; //Usuário não pode mexer ainda
    [self addSubview:container];

}

@end
