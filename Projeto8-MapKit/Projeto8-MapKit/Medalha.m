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

-(id)initMedalha:(NSString*)idMedalha :(int)contGanharMedalha :(CGRect)rectView{
    self=[super init];
    
    if (self) {
        //Seta o frame para poder redimencionar a img
        [self setFrame:rectView];
        
        [self configMensagem:contGanharMedalha :idMedalha];
        //Alterar config imgagem para tratar diferentes medalhas // atualmente esta padrão
        [self configImagem:contGanharMedalha];
        
        if (contGanharMedalha ==0) {
            [self setMensagem:[NSString stringWithFormat:@"Parabéns! Você pode se considerar %@",self.nomeMedalha]];
        }
        
        [self addSubview:self->imagem];
        
        //Adiciona gesto tap para aparecer as info
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(mostrarInfo)];
        
        [self addGestureRecognizer:tap];
    }
    
    return self;
}

-(void)configImagem:(int)contGanharMedalha{
    //O contador é decresente
    //alterar caso queira imagens diferentes p cada medalha
    //self.imagem=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
    
    UIImage *imagemAdd = [self redimencionarImagem:[UIImage imageNamed:@"conquistas"] escalaSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    
    
    self.imagem=[[UIImageView alloc]initWithImage:imagemAdd];
    
    if (contGanharMedalha!=0) {
        [self.imagem setAlpha:0.5f];
    }else{
        [self.imagem setAlpha:1.0f];
    }
}

-(void)mostrarInfo{
    UIAlertView *alerta=[[UIAlertView alloc]initWithTitle:self.nomeMedalha message:self.mensagem delegate:nil cancelButtonTitle:@"Fantástico" otherButtonTitles: nil];
    
    [alerta show];
}

-(UIImage*)redimencionarImagem:(UIImage*)_imagem escalaSize:(CGSize)novoSize{
    
    UIGraphicsBeginImageContextWithOptions(novoSize, NO, 0.0);
    
    [_imagem drawInRect:CGRectMake(0, 0, novoSize.width, novoSize.height)];
    
    UIImage *novaImagem = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return novaImagem;
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

+(NSString*)pegaIDMedalhaCategoria:(NSString*)categoria{

    //Cria array com os ID`s e um array com as categorias na MESMA ordem
    NSArray *medalhas=@[@"apreciadorNatureza",@"oPasseador",@"maquinaTempo",@"artesCenicas",@"amantesAnimais",@"grandeLeitor",@"grandeAntropologo",@"grandeHistoriador",@"exploradorIluminado",@"exploradorEcletico"];
    
    NSArray *categorias=@[@"Parque",@"Pracas",@"Museus",@"Teatro",@"Zoologicos",@"Biblioteca",@"EspacosCulturais",@"EdificiosReligiosos",@"Outros"];
    
    int num=[categorias indexOfObject:categoria];
    
    //Retorna a Key na tabela
    
    return [medalhas objectAtIndex:num];
}

+(int)bonusMedalhaCategoria:(NSString*)categoria{
    
    NSArray *medalhas=@[@"amantesAnimais",@"grandeHistoriador",@"exploradorEcletico",@"aprendizExplorador",@"exploradorMediano",@"superExplorador",@"exploradorMestre",@"exploradorCorajoso",@"primeirosPassos",@"exploradorCompanheiro",@"exploradorNostalgico",@"maiorExplorador"];
    
    int contArray=[medalhas indexOfObject:categoria];
    
    int valorRetornar;
    
    switch (contArray) {
        case 0:
            valorRetornar=50;
            break;
            
        case 1:
            valorRetornar=120;
            break;
            
        case 2:
            valorRetornar=80;
            break;
            
        case 3:
            valorRetornar=10;
            break;
            
        case 4:
            valorRetornar=20;
            break;
            
        case 5:
            valorRetornar=30;
            break;
            
        case 6:
            valorRetornar=40;
            break;
            
        case 7:
            valorRetornar=50;
            break;
            
        case 8:
            valorRetornar=30;
            break;
            
        case 9:
            valorRetornar=40;
            break;
            
        case 10:
            valorRetornar=40;
            break;
            
        case 11:
            valorRetornar=500;
            break;
            
        default:
            valorRetornar=100;
            break;
    }
    
    return valorRetornar;
}


@end
