//
//  RoletaViewController.m
//  Projeto8-MapKit
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 28/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "RoletaViewController.h"

@interface RoletaViewController ()

@end

@implementation RoletaViewController

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
    self.lugares = [Lugares sharedLugares];
    
    if([DadosUser existeDesafio]){
        //desabilita o btn
        [self.btnSortear setAlpha:0];
        
        //A FAZER:
        //colocar a imagem de acordo com a categoria --> self.imgCategoria
        //colocar o nome de acordo com a atração --> self.self.lblNomeAtracao
        //colocar o endereço de acordo com a atração --> self.lblEnderecoAtracao
        //colocar a descrição de acordo com a atração --> self.txtDescricaoAtracao
        
        //fazer as 4 variáveis acima terem o alpha alterados para 1
        
    }
    
    else{
        //faz sumir a imagem, nome, endereco e descricao
        [self.imgCategoria setAlpha:0];
        [self.lblNomeAtracao setAlpha:0];
        [self.lblEnderecoAtracao setAlpha:0];
        [self.txtDescricaoAtracao setAlpha:0];
        
    }
    
}

- (IBAction)sortear:(id)sender {
    //sorteia
    [self sorteiaCategoria];
    [self sorteiaAtracaoPelaCategoria];
    
    //teste para ver se está pegando o nome
    self.desafio = [[[[[self.lugares objectForKey:@"Categoria"] objectAtIndex:self.categoria] objectForKey:@"Lugares"]objectAtIndex:self.atracao] objectForKey:@"Nome"];
    
    NSLog(@"%@", self.desafio);
    
    //mostra informações do local
    [DadosUser gravarDesafio:self.desafio];
    
    [self.btnSortear setAlpha:0];
}


-(void)sorteiaCategoria
{
    self.categoria = arc4random() % [[self.lugares objectForKey:@"Categoria"] count];
    NSLog(@"%i", self.categoria);
}

-(void)sorteiaAtracaoPelaCategoria
{
    self.atracao = arc4random() % [[[[self.lugares objectForKey:@"Categoria"] objectAtIndex:self.categoria] objectForKey:@"Lugares"] count];
    NSLog(@"Categoria:%i | Atração:%i/%i", self.categoria, self.atracao, [[[[self.lugares objectForKey:@"Categoria"] objectAtIndex:self.categoria] objectForKey:@"Lugares"] count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
