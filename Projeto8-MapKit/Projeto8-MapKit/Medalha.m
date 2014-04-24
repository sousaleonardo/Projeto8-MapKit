//
//  Medalha.m
//  Projeto8-MapKit
//
//  Created by Leonardo de Sousa Mendes on 24/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "Medalha.h"

@implementation Medalha
@synthesize nomeMedalha,imagem,mensagem,pontosGanhos;

-(id)initMedalha:(NSString*)idMedalha :(int)contGanharMedalha{
    self=[super init];
    
    if (self) {
        [self configMensagem:contGanharMedalha :idMedalha];
        //Alterar config imgagem para tratar diferentes medalhas // atualmente esta padrão
        [self configImagem:contGanharMedalha];
        
        if (contGanharMedalha ==0) {
            [self setMensagem:[NSString stringWithFormat:@"Parabéns! Você pode se considerar %@",self.nomeMedalha]];
        }
    }
    
    return self;
}

-(void)configImagem:(int)contGanharMedalha{
    //O contador é decresente
    //alterar caso queira imagens diferentes p cada medalha
    self.imagem=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"medalha"]];
    
    if (contGanharMedalha!=0) {
        [self.imagem setAlpha:0.5f];
    }else{
        [self.imagem setAlpha:1.0f];
    }
}

-(void)configMensagem:(int)contGanharMedalha :(NSString*)idMedalha{
    
    NSArray *medalhas=@[@"apreciadorNatureza",@"oPasseador",@"maquinaTempo",@"artesCenicas",@"amantesAnimais",@"grandeLeitor",@"grandeAntropologo",@"grandeHistoriador",@"exploradorIluminado",@"exploradorEcletico",@"aprendizExplorador",@"exploradorMediano",@"superExplorador",@"exploradorMestre",@"exploradorCorajoso",@"primeirosPassos",@"exploradorCompanheiro",@"exploradorNostalgico",@"grandeConquistador",@"maiorExplorador"];
    
    int num=[medalhas indexOfObject:idMedalha];
    
    switch (num) {
        case 0:
            [self setNomeMedalha:@"Apreciador da Natureza"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i parques!",contGanharMedalha]];
            [self setPontosGanhos:100];
            break;
            
        case 1:
            [self setNomeMedalha:@"O passeador"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i praças!",contGanharMedalha]];
            [self setPontosGanhos:100];
            break;
            
        case 2:
            [self setNomeMedalha:@"Máquina do Tempo"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i museus!",contGanharMedalha]];
            [self setPontosGanhos:100];
            break;
            
        case 3:
            [self setNomeMedalha:@"Apreciador das Artes Cênicas"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i teatros!",contGanharMedalha]];
            [self setPontosGanhos:100];
            break;
            
        case 4:
            [self setNomeMedalha:@"Amante dos Animais"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i Zoo's!",contGanharMedalha]];
            [self setPontosGanhos:50];
            break;
            
        case 5:
            [self setNomeMedalha:@"Grande Leitor"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i bibliotecas/livrarias!",contGanharMedalha]];
            [self setPontosGanhos:100];
            break;
            
        case 6:
            [self setNomeMedalha:@"Grande Antropólogo"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i Edificios Culturais!",contGanharMedalha]];
            [self setPontosGanhos:100];
            break;
            
        case 7:
            [self setNomeMedalha:@"Grande Historiador"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i Edificios Históricos!",contGanharMedalha]];
            [self setPontosGanhos:120];
            break;
            
        case 8:
            [self setNomeMedalha:@"Explorador Iluminado"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i Espaços Religiosos!",contGanharMedalha]];
            [self setPontosGanhos:100];
            break;
            
        case 9:
            [self setNomeMedalha:@"Explorador Eclético"];
            [self setMensagem:[NSString stringWithFormat:@"Falta visitar %i lugares da categoria Outros!",contGanharMedalha]];
            [self setPontosGanhos:80];
            break;
            
        case 10:
            [self setNomeMedalha:@"Apredendiz de Explorador"];
            [self setMensagem:[NSString stringWithFormat:@"Visite 2 lugares no mesmo dia!"]];
            [self setPontosGanhos:10];
            break;
            
        case 11:
            [self setNomeMedalha:@"Explorador Mediano"];
            [self setMensagem:[NSString stringWithFormat:@"Visite 3 lugares no mesmo dia!"]];
            [self setPontosGanhos:20];
            break;
            
        case 12:
            [self setNomeMedalha:@"Super Explorador"];
            [self setMensagem:[NSString stringWithFormat:@"Visite 4 lugares no mesmo dia!"]];
            [self setPontosGanhos:30];
            break;
            
        case 13:
            [self setNomeMedalha:@"Explorador Mestre"];
            [self setMensagem:[NSString stringWithFormat:@"Visite 5 lugares no mesmo dia!"]];
            [self setPontosGanhos:40];
            break;
            
        case 14:
            [self setNomeMedalha:@"Explorador Corajoso"];
            [self setMensagem:[NSString stringWithFormat:@"Visite um lugar marcado como desafio!"]];
            [self setPontosGanhos:50];
            break;
            
        case 15:
            [self setNomeMedalha:@"Primeiros Passos"];
            [self setMensagem:[NSString stringWithFormat:@"Faça uma Visita!"]];
            [self setPontosGanhos:30];
            break;
            
        case 16:
            [self setNomeMedalha:@"Explorador Companheiro"];
            [self setMensagem:[NSString stringWithFormat:@"Faça uma visita com outro explorador!"]];
            [self setPontosGanhos:40];
            break;
            
        case 17:
            [self setNomeMedalha:@"Explorador Nostálgico"];
            [self setMensagem:[NSString stringWithFormat:@"Visite o mesmo lugar mais de uma vez!"]];
            [self setPontosGanhos:40];
            break;
            
        case 18:
            [self setNomeMedalha:@"O grande Conquistador"];
            [self setMensagem:[NSString stringWithFormat:@"Aceite mais %i desafios!",contGanharMedalha]];
            [self setPontosGanhos:100];
            break;
            
        case 19:
            [self setNomeMedalha:@"O maior dos Exploradores!"];
            [self setMensagem:[NSString stringWithFormat:@"Ganhe mais %i medalhas!",contGanharMedalha]];
            [self setPontosGanhos:500];
            break;
            
        default:
            break;
    }
}
@end
