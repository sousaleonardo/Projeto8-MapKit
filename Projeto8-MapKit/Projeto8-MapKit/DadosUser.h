//
//  DadosUser.h
//  Projeto8-MapKit
//
//  Created by LEONARDO DE SOUSA MENDES on 22/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Medalha.h"
#import <FacebookSDK/FacebookSDK.h>

@protocol DadosUser <NSObject>
@optional
-(void)dadosDidLogin:(BOOL)logado;
-(void)adicionarMedalha:(NSString*)idMEdalaha :(int)contGanharMedalha;
-(void)salvarBonusMedalha:(NSString*)idMedalha;

@end

@interface DadosUser : NSObject

+(void)login:(id<DadosUser>)delegate;

+(void)salvarLugar:(NSString*)nomeAtracao :(NSNumber*)latitude :(NSNumber*)longitude;
+(void)lugaresVisitados;
+(void)salvarMedalha:(NSString*)nomeMedalha;
+(void)medalhasSalvas:(id)delegate;

+(void)inicializaMedalhas;
+(BOOL)userLogado;
+(void)logout;
+(void)processarIaMedalha:(NSString*)nomeAtracao :(NSString*)categoria;
@end
