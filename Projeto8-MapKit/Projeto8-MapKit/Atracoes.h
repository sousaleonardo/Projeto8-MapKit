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
<<<<<<< HEAD
    Outros = 0,
    Parque,
    Pracas,
    Museus,
    Teatro,
    Zoologicos,
    Biblioteca,
    EspacosCulturais,
    EdificiosReligiosos,
=======
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
>>>>>>> Branch-do-Leo-vai-q-neh
};

@interface Atracoes: NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
<<<<<<< HEAD
@property (nonatomic, strong) NSString *nomeLocal;
@property (nonatomic, strong) NSString *descricaoLocal;
=======
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property NSString *descricao;
@property NSString *endereco;
@property NSInteger pontos;

>>>>>>> Branch-do-Leo-vai-q-neh
@property (nonatomic) TipoAtracao tipoDeAtracao;

@end
