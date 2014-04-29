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
    
    //para tirar o local de sorteio
    [DadosUser gravarDesafio:nil];
    
    
    if([DadosUser existeDesafio]){
        //desabilita o btn
        [self.btnSortear setAlpha:0];
        
        [self.imgCategoria setAlpha:1];
        [self.txtNomeAtracao setAlpha:1];
        [self.txtEnderecoAtracao setAlpha:1];
        [self.txtDescricaoAtracao setAlpha:1];
        
        [self adicionarImagem];
        [self adicionaOutrasCaracteristicas];
        
    }
    
    else{
        //faz sumir a imagem, nome, endereco e descricao
        [self.imgCategoria setAlpha:0];
        [self.txtNomeAtracao setAlpha:0];
        [self.txtEnderecoAtracao setAlpha:0];
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
    
    //depois de sortear, deve mostrar as coisas e esconder o btn
    [self.btnSortear setAlpha:0];
    
    [self.imgCategoria setAlpha:1];
    [self.txtNomeAtracao setAlpha:1];
    [self.txtEnderecoAtracao setAlpha:1];
    [self.txtDescricaoAtracao setAlpha:1];
    
    [self adicionarImagem];
    [self adicionaOutrasCaracteristicas];
    
}

-(void)adicionarImagem
{
    NSLog(@"%i", self.categoria);
    switch (self.categoria) {
        case 0:
            [self.imgCategoria setImage:[UIImage imageNamed:@"0_parquesIcone.png"]];
            break;
        case 1:
            [self.imgCategoria setImage:[UIImage imageNamed:@"1_pracasIcone.png"]];
            break;
        case 2:
            [self.imgCategoria setImage:[UIImage imageNamed:@"2_museusIcone.png"]];
            break;
        case 3:
            [self.imgCategoria setImage:[UIImage imageNamed:@"3_teatrosIcone.png"]];
            break;
        case 4:
            [self.imgCategoria setImage:[UIImage imageNamed:@"4_zoologicosIcone.png"]];
            break;
        case 5:
            [self.imgCategoria setImage:[UIImage imageNamed:@"5_bibliotecasIcone.png"]];
            break;
        case 6:
            [self.imgCategoria setImage:[UIImage imageNamed:@"6_centrosCulturaisIcone.png"]];
            break;
        case 7:
            [self.imgCategoria setImage:[UIImage imageNamed:@"7_edificiosHistoricosIcone.png"]];
            break;
        case 8:
            [self.imgCategoria setImage:[UIImage imageNamed:@"8_igrejasIcone.png"]];
            break;
        case 9:
            [self.imgCategoria setImage:[UIImage imageNamed:@"9_outrosIcone.png"]];
            break;
        default:
            break;
    }
}

-(void)adicionaOutrasCaracteristicas
{

    [self.txtNomeAtracao setText:[[[[[self.lugares objectForKey:@"Categoria"] objectAtIndex:self.categoria] objectForKey:@"Lugares"] objectAtIndex:self.atracao] objectForKey:@"Nome"]];
    [self.txtEnderecoAtracao setText:[[[[[self.lugares objectForKey:@"Categoria"] objectAtIndex:self.categoria] objectForKey:@"Lugares"] objectAtIndex:self.atracao] objectForKey:@"Endereco"]];
    [self.txtDescricaoAtracao setText:[[[[[self.lugares objectForKey:@"Categoria"] objectAtIndex:self.categoria] objectForKey:@"Lugares"] objectAtIndex:self.atracao] objectForKey:@"Descricao"]];
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
