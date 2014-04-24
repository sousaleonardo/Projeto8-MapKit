//
//  InformacoesViewController.h
//  Projeto8-MapKit
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 23/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ViewController.h"
#import "Atracoes.h"

@interface InformacoesViewController : ViewController
@property (strong, nonatomic) IBOutlet UIImageView *imagemLocal;
@property (strong, nonatomic) IBOutlet UILabel *nomeLocal;
@property (strong, nonatomic) IBOutlet UILabel *precoLocal;
@property (strong, nonatomic) IBOutlet UILabel *enderecoLocal;
@property (strong, nonatomic) IBOutlet UITextView *informacoesLocal;
@property Atracoes *atracao;
@end
