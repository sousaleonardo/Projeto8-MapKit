//
//  Categoria.m
//  Projeto8-MapKit
//
//  Created by Júlia Yamamoto on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "Categoria.h"

@implementation Categoria

@synthesize valorMaximo, valorMinimo, valorMediano, categoria;

//retorna uma string com tudo o que é necessário saber sobre a categoria
-(NSString *) atributosDaCategoria
{
    return [NSString stringWithFormat:@"%i | %f, %f, %f", categoria, valorMinimo, valorMediano, valorMaximo];
}

@end
