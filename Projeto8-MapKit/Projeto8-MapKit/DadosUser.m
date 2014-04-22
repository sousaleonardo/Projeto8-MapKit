//
//  DadosUser.m
//  Projeto8-MapKit
//
//  Created by LEONARDO DE SOUSA MENDES on 22/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

//Classe usada para fazer a comunicação com o PARSE, e pegar o dados do user
#import "DadosUser.h"
#import <FacebookSDK/FacebookSDK.h>
@implementation DadosUser

+(void)login:(id<DadosUser>)delegate
{
    //Info basicas do user
    [PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {
        //Logou com sucesso?
        if(!user){
            if (!error) {
                NSLog(@"Usuário cancelou login");
            }else{
                NSLog(@"Erro ocorreu: %@",error.localizedDescription);
            }
            
            //Chama metodo passando logado como NO
            if ([delegate respondsToSelector:@selector(dadosDidLogin:)]) {
                [delegate dadosDidLogin:NO];
            }
        }else{
            //Verifica se o user é novo
            if (user.isNew) {
                NSLog(@"Usuário cadastrado e logado atraves do FB!");
            }else{
                NSLog(@"Usuário logado pelo FB");
            }
            
            //Chama metodo passando logado YES
            if ([delegate respondsToSelector:@selector(dadosDidLogin:)]) {
                [delegate dadosDidLogin:YES];
            }
        }
    }];
}

+(void)logout{
    [PFUser logOut];
}
@end
