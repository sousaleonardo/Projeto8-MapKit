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
    Outros = 0,
    Parque,
    Pracas,
    Museus,
    Teatro,
    Zoologicos,
    Biblioteca,
    EspacosCulturais,
    EdificiosReligiosos,
};

@interface Atracoes: NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *nomeLocal;
@property (nonatomic, strong) NSString *descricaoLocal;
@property (nonatomic) TipoAtracao tipoDeAtracao;

@end
