//
//  Lugares.m
//  Projeto8-MapKit
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 23/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "Lugares.h"

@implementation Lugares

+(id)sharedLugares
{
    static Lugares *lugares = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DadosLocais" ofType:@"plist"];
        lugares = [self dictionaryWithContentsOfFile:filePath];
    });
    return lugares;
}
@end
