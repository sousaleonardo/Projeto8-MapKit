//
//  RoletaViewController.h
//  Projeto8-MapKit
//
//  Created by JULIA ARISSA COPPOLA YAMAMOTO on 28/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DadosUser.h";
#import "Lugares.h"

@interface RoletaViewController : UIViewController

@property int categoria;
@property int atracao;
@property Lugares *lugares;
@property NSString *desafio;

@property (weak, nonatomic) IBOutlet UIButton *btnSortear;
@property (weak, nonatomic) IBOutlet UIImageView *imgCategoria;
@property (weak, nonatomic) IBOutlet UITextView *txtNomeAtracao;
@property (weak, nonatomic) IBOutlet UITextView *txtEnderecoAtracao;
@property (weak, nonatomic) IBOutlet UITextView *txtDescricaoAtracao;

@end
