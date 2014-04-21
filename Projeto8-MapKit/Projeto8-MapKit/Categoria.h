//
//  Categoria.h
//  Projeto8-MapKit
//
//  Created by Júlia Yamamoto on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Categoria : NSObject

//As propriedades abaixo, ajudam a saber em que categoria está. Entre o valor minimo(float) e máximo(float), a categoria selecionada é a armazenada na variável categoria(int) e deixada posicionada na posição marcada em valorMediano(float).
@property float valorMinimo;
@property float valorMaximo;
@property float valorMediano;
@property int categoria;

-(NSString *) atributosDaCategoria;

@end
