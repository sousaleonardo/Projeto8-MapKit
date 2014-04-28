//
//  MedalhaViewController.m
//  Projeto8-MapKit
//
//  Created by LEONARDO DE SOUSA MENDES on 22/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "MedalhaViewController.h"

@interface MedalhaViewController ()

@end

@implementation MedalhaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //inicia sem medalhas e acrescenta ao rodar
    self->contMedalhas=0;
    self->medalhasAdicionadas=0;
    
    self->posXUsar=self.viewParte1.frame.origin.x +10;
    self->posYUsar=self.viewParte1.frame.origin.y +20;
    
    //verifica se ja esta logado, para diminuir as requisiçoes ao site ;)
    if (![DadosUser userLogado]) {
        //loga o user no parse
        [DadosUser login:self];
    }else{
        [DadosUser medalhasSalvas:self];
        
    }
    
    [self.view addSubview:self.viewParte1];
    
    [self.view addSubview:self.viewParte2];
    
    self.medalhas=[NSMutableArray array];

    
    //[DadosUser salvarMedalha:@"primeirosPassos"];
    //[DadosUser processarIaMedalha:@"Praça Roosevelt" :@"Pracas"];
    [DadosUser gravarDesafio:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dadosDidLogin:(BOOL)logado{
    if (logado) {
        NSLog(@"Logado");
        
        //Busca pelas informações das medalhas do user no PARSE
        [DadosUser medalhasSalvas:self];
        
    }else{
        NSLog(@"Não Logado");
        
        //AlertView Avisando
        UIAlertView *alerta =[[UIAlertView alloc]initWithTitle:@"Opss..." message:@"Não Foi Possível se conectar ao sefvidor!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alerta show];
    }
}

-(void)adicionarMedalha:(NSString*)idMEdalaha :(int)contGanharMedalha{
    
    float tamRect=self.viewParte1.frame.size.width/MEDALHASLINHA;
    
    
    if (self->contMedalhas<10) {
        
        if (self->medalhasAdicionadas==4) {
            self->posXUsar=self.viewParte1.frame.origin.x +10;
            self->posYUsar= self->posYUsar + 74;
            self->medalhasAdicionadas=0;
        }
        
        Medalha *medalhaAdd =[[Medalha alloc]initMedalha:idMEdalaha :contGanharMedalha :CGRectMake(posXUsar, posYUsar, tamRect, tamRect)];
        
        [self.viewParte1 addSubview:medalhaAdd];
        self->posXUsar = self->posXUsar + tamRect + 5;
        
        self->medalhasAdicionadas ++;
        
        [self.medalhas addObject:medalhaAdd];
        
    }else{
        if (self->contMedalhas==10) {
            self->posXUsar=10;
            self->posYUsar=10;
            
            self->medalhasAdicionadas=0;
        }
        
        if (self->medalhasAdicionadas==4) {
            self->posXUsar=self.viewParte2.frame.origin.x +10;
            self->posYUsar= self->posYUsar + 74;
            
            self->medalhasAdicionadas=0;
        }
        
        Medalha *medalhaAdd =[[Medalha alloc]initMedalha:idMEdalaha :contGanharMedalha :CGRectMake(posXUsar, posYUsar, tamRect, tamRect)];
        
        [medalhaAdd setFrame:CGRectMake(posXUsar, posYUsar, tamRect, tamRect)];
        
        [self.viewParte2 addSubview:medalhaAdd];
        self->posXUsar = self->posXUsar + tamRect + 5;
        
        self->medalhasAdicionadas++;
        
        [self.medalhas addObject:medalhaAdd];
    }
    
    self->contMedalhas++;
    
    
}
@end
