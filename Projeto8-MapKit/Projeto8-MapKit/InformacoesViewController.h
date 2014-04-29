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
@property (strong, nonatomic) IBOutlet UITextView *nomeLocal;
@property (strong, nonatomic) IBOutlet UITextView *precoLocal;
@property (strong, nonatomic) IBOutlet UITextView *enderecoLocal;
@property (strong, nonatomic) IBOutlet UITextView *informacoesLocal;
@property Atracoes *atracao;
@end
