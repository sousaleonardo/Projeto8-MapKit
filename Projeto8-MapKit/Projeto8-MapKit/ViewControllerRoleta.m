//
//  ViewControllerRoleta.m
//  Projeto8-MapKit
//
//  Created by Júlia Yamamoto on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ViewControllerRoleta.h"
@interface ViewControllerRoleta ()
@end

@implementation ViewControllerRoleta
@synthesize lblCategoriaAtual, roleta;

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
	
    //Inicializa a roleta no ViewController dela, passando o frame, delegate e numero de categorias, no caso, 10.
    roleta = [[ControleRoleta alloc]initWithFrame:CGRectMake(30, 20, 200, 200) andDelegate:self withSections:10];
    roleta.center = CGPointMake(130, 240);
    
    //Inicializa o label da categoria atual
    lblCategoriaAtual = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 120, 30)];
    lblCategoriaAtual.text = @"oi";
    
    //Adiciona á view
    [self.view addSubview: roleta]; //roleta
    [self.view addSubview: lblCategoriaAtual]; //label da categoria atual
}

-(void)roletaMudouDeValor:(NSString *)novoValor
{
    lblCategoriaAtual.text = novoValor;
    NSLog(@"%@", novoValor);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
