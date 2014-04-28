//
//  MenuViewController.m
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [FBProfilePictureView class];
    
    //Peço educadamente as permissoes
    [DadosUser permissaoFB];
    
    //coloca o nome e a imagem de perfil do usuario
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            self.imagemPerfil.profileID = [result id];
            [self.nome setText:[result name]];
            
        } else {
            
        }
    }];
    
    //coloca a pontuacao do usuario
    [FBRequestConnection startWithGraphPath:@"me/scores"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error) {
         NSLog(@"%@",result);
         
         int nCurrentScore = [[[[result objectForKey:@"data"] objectAtIndex:0] objectForKey:@"score"] intValue];
         
         
         NSString *score = [NSString stringWithFormat:@"Pontos: %d",nCurrentScore];
         [self.pontosUsuario setText:score];
     }];
    
    [DadosUser login:self];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
