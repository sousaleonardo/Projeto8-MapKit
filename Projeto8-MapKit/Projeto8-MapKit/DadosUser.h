//
//  DadosUser.h
//  Projeto8-MapKit
//
//  Created by LEONARDO DE SOUSA MENDES on 22/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@protocol DadosUser <NSObject>
@optional
-(void)dadosDidLogin:(BOOL)logado;
@end

@interface DadosUser : NSObject

+(void)login:(id<DadosUser>)delegate;

+(void)salvarLugar;
+(void)lugaresVisitados;
+(void)salvarMedalha;
+(void)medalhasSalvas;

@end
