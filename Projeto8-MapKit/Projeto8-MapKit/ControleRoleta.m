//
//  ControleRoleta.m
//  Projeto8-MapKit
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 17/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ControleRoleta.h"

//Método privado de desenhar a roleta
@interface ControleRoleta()
-(void)desenhaRoleta;
@end

@implementation ControleRoleta

@synthesize delegate, container, numeroDeCategorias, tamanhoAngulo, transformacaoInicial, deltaAngulo;

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
        
        //cira um timer para rodar a roleta
        //[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(rodar) userInfo:Nil repeats:YES];
    }
    return self;
}

-(void)desenhaRoleta
{
    //Cria a view que conterá a roleta
    container = [[UIView alloc] initWithFrame:self.frame];
    
    //Em um círculo temos 2*PI radianos(razão entre o comprimento de um arco e o seu raio)
    //Dividindo pelo numero de categorias, temos o tamanho a que cada categoria pertence
    self.tamanhoAngulo = 2 * M_PI / numeroDeCategorias;
    
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

-(void)rodar
{
    //irá girar de x em x, sendo x o angulo de cada categoria definido pela variável "tamanhoAngulo"
    CGAffineTransform t = CGAffineTransformRotate(container.transform, tamanhoAngulo);
    container.transform = t;
}

//calcula a distância do ponto clicado até o centro. - NÃO USADO
-(float)calculaDistanciaDoCentro: (CGPoint) pontoDeToque
{
    //grava as coordenadas do centro da tela
    CGPoint centro = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    
    //calcula a distância até o centro
    float distanciaX = pontoDeToque.x - centro.x;
    float distanciaY = pontoDeToque.y - centro.y;
    
    return sqrt((distanciaX * distanciaX) + (distanciaY * distanciaY));
}

//sobreescrevendo o método que é chamado quando o usuário toca na tela para rastrear onde foi o toque
//método armazena as informações iniciais, assim que o usuário toca na tela
-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    //armazena onde o usuário tocou
    CGPoint pontoDeToque = [touch locationInView:self];
    
    //calcula a distância até o centro do container da roleta
    float distanciaX = pontoDeToque.x - container.center.x;
    float distanciaY = pontoDeToque.y - container.center.y;
    
    //calcula o valor do "arctangent" (encontra o angulo a partir do radiano passado)
    deltaAngulo = atan2(distanciaX, distanciaY);
    
    //salva a transformacao atual
    transformacaoInicial = container.transform;
    
    return YES;
}

//sobreescrevendo o método que é chamado para rastrear por onde o usuário está passando
//método armazena as informações finais e intermediárias, enquanto o usuário faz movimentos tocando na tela
-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    //armazena até onde o usuário tocou
    CGPoint pontoDeToque = [touch locationInView:self];
    
    //calcula a distância até o centro do container da roleta
    float distanciaX = pontoDeToque.x - container.center.x;
    float distanciaY = pontoDeToque.y - container.center.y;
    
    //calcula o valor do "arctangent" (encontra o angulo a partir do radiano passado)
    float anguloAtual = atan2(distanciaX, distanciaY);
    
    //calcula a diferença entre esse angulo e o inicial para descobrir o que o usuário fez - para onde ele girou
    float diferencaAngulo = deltaAngulo - anguloAtual;
    
    //transforma a roleta dependendo de onde para onde ele moveu
    container.transform = CGAffineTransformRotate(transformacaoInicial, diferencaAngulo);
    
    
    return YES;
}



@end
