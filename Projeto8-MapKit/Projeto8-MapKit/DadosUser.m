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
                //NSLog(@"Usuário cadastrado e logado atraves do FB!");
                //Verifica se é um novo user
            }else{
                //User já existe
                //NSLog(@"Usuário logado pelo FB");
            }
            
            //Chama metodo passando logado YES
            if ([delegate respondsToSelector:@selector(dadosDidLogin:)]) {
                [delegate dadosDidLogin:YES];
            }
        }
    }];
}


+(void)salvarLugar:(NSString*)nomeAtracao :(NSNumber*)latitude :(NSNumber*)longitude{
    //Class name é como se fosse o nome da tabela no site
    PFObject *atracaoVisitada=[PFObject objectWithClassName:@"AtracaoVisitada"];
    
    //a string entre colchetes é o nome do campo
    atracaoVisitada[@"NomeAtracao"]=nomeAtracao;
<<<<<<< HEAD
    atracaoVisitada[@"LocAtracao"]=[PFGeoPoint geoPointWithLatitude:[latitude doubleValue] longitude:[longitude doubleValue]];
    atracaoVisitada[@"userName"]=[PFUser currentUser].username;

=======
    //atracaoVisitada[@"LocAtracao"]=[PFGeoPoint geoPointWithLatitude:[latitude doubleValue]  longitude:[longitude doubleValue]];
    //PFGeoPoint *locAtracao=[PFGeoPoint geoPointWithLatitude:latitude longitude:longitude];
    atracaoVisitada[@"userName"]=[PFUser user].username;
    
>>>>>>> 1a0d854cad1085751ffe29478066138f93c2e949
    //Estou usando o save Eventually para permitir que salve mesmo sem ter conexão com a internet
    //Assim quando o disp tiver conexão e o app estiver aberto ele irá salvar se o app estiver fechado na prox vez que abrir com net ele salva
    [atracaoVisitada saveEventually];
}

//Melhorar método
+(void)lugaresVisitados{
    NSLog(@"%@",[PFUser currentUser].username);
    
    //Cria o predicado para usar como filtro
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"userName=%@",[PFUser currentUser].username];
    
    //Cria a query que puxará os dados
    PFQuery *lugaresVisitados=[PFQuery queryWithClassName:@"AtracaoVisitada" predicate:predicate];
    
    // lugaresVisitados ge
    //Chamo a query criada para puxar os dados
    [lugaresVisitados findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Consegui!");
            
            //Pega os objetos
            for (PFObject *obj in objects) {
                NSLog(@"%@",obj);
            }
        }
    }];
}

+(void)salvarMedalha:(NSString*)nomeMedalha{
    //O mesmo processo usado no local visitado
    //PFObject *medalha
}

+(void)medalhasSalvas{
    NSLog(@"%@",[PFUser currentUser].username);
    
    //Cria o predicado para usar como filtro
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"userName=%@",[PFUser currentUser].username];
    
    //Cria a query que puxará os dados
    PFQuery *lugaresVisitados=[PFQuery queryWithClassName:@"Medalha" predicate:predicate];
    
    // lugaresVisitados ge
    //Chamo a query criada para puxar os dados
    [lugaresVisitados findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Consegui!");
            
            //Pega os objetos
            for (PFObject *obj in objects) {
                NSLog(@"%@",obj);
            }
        }
    }];
}

+(void)logout{
    [PFUser logOut];
}
@end
