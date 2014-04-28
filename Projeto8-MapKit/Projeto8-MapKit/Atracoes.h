//
//  Atracoes.h
//  Projeto8-MapKit
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 22/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef NS_ENUM(NSInteger, TipoAtracao) {
    Outros = 9,
    Parque = 0,
    Pracas = 1,
    Museus = 2,
    Teatro = 3,
    Zoologicos = 4,
    Biblioteca = 5,
    EspacosCulturais = 6,
    EdificiosReligiosos = 7,
    Igrejas = 8
};

@interface Atracoes: NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property NSString *descricao;
@property NSString *endereco;
@property NSInteger pontos;

@property (nonatomic) TipoAtracao tipoDeAtracao;

@end
