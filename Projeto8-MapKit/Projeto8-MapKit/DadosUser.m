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
                //[self permissaoFB];
                [self criarPontos];
            }else{
                //User já existe
                //NSLog(@"Usuário logado pelo FB");
            }
            
            //Chama metodo passando logado YES
            if ([delegate respondsToSelector:@selector(dadosDidLogin:)]) {
                [delegate dadosDidLogin:YES];
            }
            
            [self criarPontos];
        }
    }];
}

+(void)salvarLugar:(NSString*)nomeAtracao{
    //Class name é como se fosse o nome da tabela no site
    PFObject *atracaoVisitada=[PFObject objectWithClassName:@"AtracaoVisitada"];
    
    //a string entre colchetes é o nome do campo
    atracaoVisitada[@"NomeAtracao"]=nomeAtracao;
    atracaoVisitada[@"userName"]=[PFUser currentUser].username;
    
    
    //Estou usando o save Eventually para permitir que salve mesmo sem ter conexão com a internet
    //Assim quando o disp tiver conexão e o app estiver aberto ele irá salvar se o app estiver fechado na prox vez que abrir com net ele salva
    [atracaoVisitada saveEventually];
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
            //Pega os objetos
            for (PFObject *obj in objects) {
                NSLog(@"%@",obj);
            }
        }
    }];
}

+(void)salvarMedalha:(NSString*)idMedalha{
    
    //Busca o contador da medalha no Parse
    PFQuery *query=[PFQuery queryWithClassName:@"Medalha"];
    
    [query whereKey:@"userName" equalTo:[PFUser currentUser].username];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSNumber *number=[[objects objectAtIndex:0]valueForKey:idMedalha];
        int contMedalha=[number intValue];
        
        //Se estiver 0 sai do metodo
        if (contMedalha==0) {
            return;
        }else{
            //Senão tira um do contador
            contMedalha--;
            
                //Ficou 0 da os pontos ao user
            if (contMedalha==0) {
                //Acesso a medalha e de acordo com o ID vejo qntos pontos eu adiciono
                [self adicionaPontosMedalhaFB:[Medalha bonusMedalhaCategoria:idMedalha]];
                
                //Atualiza automaticamente o contador do maiorExplorador
                if (![idMedalha isEqualToString:@"maiorExplorador"]) {
                    [DadosUser salvarMedalha:@"maiorExplorador"];
                }
            }
            
            //salva o novo valor
            PFObject *medalhas=[query getFirstObject];
            medalhas[idMedalha]=[NSNumber numberWithInt:contMedalha];
            
            [medalhas saveEventually];
        }
    }];
    
    
    
}

+(void)medalhasSalvas:(id)delegate{
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
            
            //Cria array com
            //Removemos a chave do user name pq não nos interessa ela
            NSLog(@"%@",objects);
            
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
    medalhas[@"aprendizExplorador"]=[NSNumber numberWithInt:1];
    medalhas[@"exploradorMediano"]=[NSNumber numberWithInt:1];
    medalhas[@"superExplorador"]=[NSNumber numberWithInt:1];
    medalhas[@"exploradorMestre"]=[NSNumber numberWithInt:1];
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

+(void)processarIaMedalha:(NSString*)nomeAtracao :(NSString*)categoria{
    NSPredicate *predicado=[NSPredicate predicateWithFormat:@"userName=%@",[PFUser currentUser].username];
    PFQuery *query;
    
    //Vejo se o lugar onde esta dando checkIN e um dejafio
    //medalha exploradorCorajoso e medalha grandeConquistador
        //Para fazer busca na classe PADRÃO do Parse USER
    query =[PFUser query];
    [query whereKey:@"username" equalTo:[PFUser currentUser].username];
    
    NSString *proximoDesafio=[[query getFirstObject]objectForKey:@"proximoDesafio"];
    
    if ([nomeAtracao isEqualToString: proximoDesafio]) {
        [self salvarMedalha:@"exploradorCorajoso"];
        
        [self salvarMedalha:@"grandeConquistador"];
    }
    
    //Vejo se o amiguinho ja tem lugar salvo senão tiver medalha primeirosPassos
    query=[PFQuery queryWithClassName:@"AtracaoVisitada" predicate:predicado];
    
    if ([query countObjects]==0) {
        [self salvarMedalha:@"primeirosPassos"];
    }
    
    //Vejo se o amiguinho ja visitou esse lugar medalha exploradorNostalgico
    //Usando o objeto query ja configurado para pegar de AtracaoVisitada
    [query whereKey:@"NomeAtracao" equalTo:nomeAtracao];
    
    if ([query countObjects]>0) {
        [self salvarMedalha:@"exploradorNostalgico"];
    }else{
        // CARINHA NUNCA VISITOU ENTÃO SALVA A MEDALHA DA CATEGORIA
        //Aqui salva a medalha de acordo com a categoria do lugar parque, praça etc
        [self salvarMedalha:[Medalha pegaIDMedalhaCategoria:categoria]];
    
        //Salva o lugar de checkIN
        [self salvarLugar:nomeAtracao];
    }
    
    //recria a query para eliminar os where`s anteriores
    query=[PFQuery queryWithClassName:@"AtracaoVisitada" predicate:predicado];
    [query whereKey:@"updatedAt" greaterThan:[self dataAtual]];
    
    //Cria contador p facilitar na leitura nossa
    int contVisitas=[query countObjects];
    //Vejo quantos lugares ele ja visitou hoje de acordo c qtde medalha aprendizExplorador, exploradorMediano, superExplorador, exploradorMestre
    if (contVisitas >=2) {
        [self salvarMedalha:@"aprendizExplorador"];
    }
    
    if (contVisitas >=3){
        [self salvarMedalha:@"exploradorMediano"];
    }
    
    if (contVisitas >=4){
        [self salvarMedalha:@"superExplorador"];
    }
    
    if (contVisitas >=4){
        [self salvarMedalha:@"exploradorMestre"];
    }
    
    //Vejo se ele levou outro amiguinho
    //IMPLEMENTAR FUTURAMENTE
    
    
    
}

+(void)gravarDesafio:(NSString*)nomeDesafio{
    //Cria um obj para classe Dasafio
    NSPredicate *predicado=[NSPredicate predicateWithFormat:@"userName=%@",[PFUser currentUser].username];
    PFQuery *query=[PFQuery queryWithClassName:@"Desafio" predicate:predicado];
    
    PFObject *dadosDesafio=[query getFirstObject];
    
    if (nomeDesafio) {
        if (dadosDesafio==Nil) {
            
            dadosDesafio=[PFObject objectWithClassName:@"Desafio"];
            
            dadosDesafio[@"proximoDesafio"]=nomeDesafio;
            dadosDesafio[@"userName"]=[PFUser currentUser].username;
            
        }else{
            dadosDesafio[@"proximoDesafio"]=nomeDesafio;
            dadosDesafio[@"userName"]=[PFUser currentUser].username;
        }
        
        [dadosDesafio saveInBackground];
    }else{
        //Nao passei desafio deleta
        [dadosDesafio deleteInBackground];
    }


}

+(BOOL)existeDesafio{
    
    //Cria um obj para classe Dasafio
    NSPredicate *predicado=[NSPredicate predicateWithFormat:@"userName=%@",[PFUser currentUser].username];
    PFQuery *query=[PFQuery queryWithClassName:@"Desafio" predicate:predicado];

    
    if ([query countObjects]>0) {
        return YES;
    }else{
        return NO;
    }
}
+(NSDate*)dataAtual{
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:now];
    
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    NSDate *morningStart = [calendar dateFromComponents:components];
    
    return morningStart;
}

+(void)adicionaPontosMedalhaFB:(int)pontoAdd{
    //Requerir permissão
    [self permissaoFB];
    
    [FBRequestConnection startWithGraphPath:@"me/scores"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error) {
         if (error) {
             UIAlertView *erro = [[UIAlertView alloc]initWithTitle:@"Erro" message:@"Nao foi Possivel Enviar seus pontos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
             [erro show];
         }
         else{
             int pontosAtuais =[[[[result objectForKey:@"data"]objectAtIndex:0]objectForKey:@"score"]intValue];
             
             NSLog(@"%i",pontosAtuais);
             
             NSDictionary *pontosEnviar = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",pontoAdd+ pontosAtuais],@"score",nil];
             
             [FBRequestConnection startWithGraphPath:@"me/scores"
                                          parameters:pontosEnviar
                                          HTTPMethod:@"POST"
                                   completionHandler:
              ^(FBRequestConnection *connection, id result, NSError *error) {
                  if (error) {
                      UIAlertView *erro = [[UIAlertView alloc]initWithTitle:@"Erro" message:@"Nao foi Possivel Enviar seus pontos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                      [erro show];
                  }
                  else{
                      NSString *mensagem = [NSString stringWithFormat:@"Você ganhou %d Pontos",pontoAdd];
                      UIAlertView *ganhouPontos = [[UIAlertView alloc]initWithTitle:@"Parabéns!" message:mensagem delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                      [ganhouPontos show];
                      
                  }
                  
              }];
             
         }
         
     }];
    
}

+(void)permissaoFB{
    // We will request the user's public profile and the user's birthday
    // These are the permissions we need:
    NSArray *permissionsNeeded = @[@"publish_actions"];
    
    // Request the permissions the user currently has
    [FBRequestConnection startWithGraphPath:@"/me/permissions"
                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                              if (!error){
                                  // These are the current permissions the user has:
                                  NSDictionary *currentPermissions= [(NSArray *)[result data] objectAtIndex:0];
                                  
                                  // We will store here the missing permissions that we will have to request
                                  NSMutableArray *requestPermissions = [[NSMutableArray alloc] initWithArray:@[]];
                                  
                                  // Check if all the permissions we need are present in the user's current permissions
                                  // If they are not present add them to the permissions to be requested
                                  for (NSString *permission in permissionsNeeded){
                                      if (![currentPermissions objectForKey:permission]){
                                          [requestPermissions addObject:permission];
                                      }
                                  }
                                  
                                  // If we have permissions to request
                                  if ([requestPermissions count] > 0){
                                      // Ask for the missing permissions
                                      [FBSession.activeSession
                                       requestNewReadPermissions:requestPermissions
                                       completionHandler:^(FBSession *session, NSError *error) {
                                           if (!error) {
                                               // Permission granted
                                               NSLog(@"new permissions %@", [FBSession.activeSession permissions]);
                                               // We can request the user information
                                               //[self makeRequestForUserData];
                                           } else {
                                               // An error occurred, we need to handle the error
                                               // See: https://developers.facebook.com/docs/ios/errors
                                           }
                                       }];
                                  } else {
                                      // Permissions are present
                                      // We can request the user information
                                      //[self makeRequestForUserData];
                                  }
                                  
                              } else {
                                  // An error occurred, we need to handle the error
                                  // See: https://developers.facebook.com/docs/ios/errors
                              }
                          }];
}
+(void)criarPontos{
    NSDictionary *pontosEnviar = [NSDictionary dictionaryWithObjectsAndKeys:@"10",@"score",nil];
    
    [FBRequestConnection startWithGraphPath:@"me/scores"
                                 parameters:pontosEnviar
                                 HTTPMethod:@"POST"
                          completionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error) {
         if (error) {
             UIAlertView *erro = [[UIAlertView alloc]initWithTitle:@"Erro" message:@"Nao foi Possivel criar seus pontos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
             [erro show];
         }
         else{
            
         }
         
     }];
}
@end
