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
    // Do any additional setup after loading the view.
    
    //[DadosUser logout];
    //verifica se ja esta logado, para diminuir as requisiçoes ao site ;)
    if (![DadosUser userLogado]) {
        //loga o user no parse
        [DadosUser login:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dadosDidLogin:(BOOL)logado{
    if (logado) {
        NSLog(@"Logado");
        
    }else{
        NSLog(@"Não Logado");
    }
}

-(IBAction)salvarLugar:(id)sender{

    //[DadosUser inicializaMedalhas];
    [DadosUser medalhasSalvas:self];
}

@end
