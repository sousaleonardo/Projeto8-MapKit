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
    if([DadosUser existeDesafio]){
        //mostra desafio
        
        
    }
    else{
        //cria desafio
    }
}


-(void)sorteiaCategoria
{
    self.categoria = arc4random() % [[self.lugares objectForKey:@"Categoria"] count];
    NSLog(@"%i", self.categoria);
}

-(void)sorteiaAtracaoPelaCategoria
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
