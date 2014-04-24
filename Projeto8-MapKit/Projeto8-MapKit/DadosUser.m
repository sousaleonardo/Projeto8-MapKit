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
    atracaoVisitada[@"LocAtracao"]=[PFGeoPoint geoPointWithLatitude:[latitude doubleValue] longitude:[longitude doubleValue]];
    atracaoVisitada[@"userName"]=[PFUser currentUser].username;


    //atracaoVisitada[@"LocAtracao"]=[PFGeoPoint geoPointWithLatitude:[latitude doubleValue]  longitude:[longitude doubleValue]];
    //PFGeoPoint *locAtracao=[PFGeoPoint geoPointWithLatitude:latitude longitude:longitude];
    atracaoVisitada[@"userName"]=[PFUser user].username;
    
    //Estou usando o save Eventually para permitir que salve mesmo sem ter conexão com a internet
    //Assim quando o disp tiver conexão e o app estiver aberto ele irá salvar se o app estiver fechado na prox vez que abrir com net ele salva
    [atracaoVisitada saveEventually];
}

//Melhorar método
+(void)lugaresVisitados{
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

+(void)salvarMedalha:(NSString*)idMedalha{
    //Pega o valor atual do ID e remove 1 do contador se o contador chegar a 0 add os pontos
    
}

+(void)medalhasSalvas:(id)delegate{
    //Cria o predicado para usar como filtro
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"userName=%@",[PFUser currentUser].username];
    
    //Cria um array com os objetos recebidos
    
    
    //Cria a query que puxará os dados
    PFQuery *lugaresVisitados=[PFQuery queryWithClassName:@"Medalha" predicate:predicate];
    
    // lugaresVisitados ge
    //Chamo a query criada para puxar os dados
    [lugaresVisitados findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Consegui!");
            
            //Pega os objetos
            
            //Cria array com
            //Removemos a chave do user name pq não nos interessa ela
            [[objects objectAtIndex:0]removeObjectForKey:@"userName"];
            
            for(NSString *key in [[objects objectAtIndex:0]allKeys]){

                if ([delegate respondsToSelector:@selector(adicionarMedalha::)]){
                    [delegate adicionarMedalha:key :[[[objects objectAtIndex:0]valueForKey:key]intValue]];
                }
            }
            
        }
    }];
}

+(void)logout{
    [PFUser logOut];
}

+(void)inicializaMedalhas{
    PFObject *medalhas=[PFObject objectWithClassName:@"Medalha"];
    PFQuery *query=[PFQuery queryWithClassName:@"Medalha"];
    
    [query whereKey:@"userName" equalTo:[PFUser currentUser].username];
    
    NSInteger cont=[query countObjects];
    //Verifica se ja tem as medalhas configuradas
    if (cont>0) {
        //Ja foi configurado sai da rotina
        return;
    }
    
    //a string entre colchetes é o nome do campo
    medalhas[@"userName"]=[PFUser currentUser].username;
    
    medalhas[@"maiorExplorador"]=[NSNumber numberWithInt:20];
    medalhas[@"apreciadorNatureza"]=[NSNumber numberWithInt:17];
    medalhas[@"oPasseador"]=[NSNumber numberWithInt:3];
    medalhas[@"maquinaTempo"]=[NSNumber numberWithInt:18];
    medalhas[@"artesCenicas"]=[NSNumber numberWithInt:3];
    medalhas[@"amantesAnimais"]=[NSNumber numberWithInt:2];
    medalhas[@"grandeLeitor"]=[NSNumber numberWithInt:4];
    medalhas[@"grandeAntropologo"]=[NSNumber numberWithInt:6];
    medalhas[@"grandeHistoriador"]=[NSNumber numberWithInt:12];
    medalhas[@"exploradorIluminado"]=[NSNumber numberWithInt:7];
    medalhas[@"exploradorEcletico"]=[NSNumber numberWithInt:20];
    medalhas[@"aprendizExplorador"]=[NSNumber numberWithInt:2];
    medalhas[@"exploradorMediano"]=[NSNumber numberWithInt:3];
    medalhas[@"superExplorador"]=[NSNumber numberWithInt:4];
    medalhas[@"exploradorMestre"]=[NSNumber numberWithInt:5];
    medalhas[@"exploradorCorajoso"]=[NSNumber numberWithInt:1];
    medalhas[@"primeirosPassos"]=[NSNumber numberWithInt:1];
    medalhas[@"exploradorCompanheiro"]=[NSNumber numberWithInt:1];
    medalhas[@"exploradorNostalgico"]=[NSNumber numberWithInt:1];
    medalhas[@"grandeConquistador"]=[NSNumber numberWithInt:10];
    
    [medalhas saveInBackground];
}

+(BOOL)userLogado{
    
    if ([PFUser currentUser]) {
        return YES;
    }else{
        return NO;
    }
    
    return YES;
}
@end
