//
//  RoletaProtocol.h
//  Projeto8-MapKit
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 17/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RoletaProtocol <NSObject>

//Método que será chamado sempre que o usuário tirar o dedo da tela.
//Indica que uma nova salação foi feita
-(void) roletaMudouDeValor: (NSString *) novoValor;

@end
