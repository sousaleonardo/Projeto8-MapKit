//
//  Medalha.h
//  Projeto8-MapKit
//
//  Created by Leonardo de Sousa Mendes on 24/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Medalha : NSObject

@property NSString *nomeMedalha;
@property NSString *idMedalha;
@property UIImageView *imagem;
@property NSString *mensagem;
@property int pontosGanhos;

-(id)initMedalha:(NSString*)idMedalha :(int)contGanharMedalha;

@end
