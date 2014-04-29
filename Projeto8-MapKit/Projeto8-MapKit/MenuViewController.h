//
//  MenuViewController.h
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ViewController.h"
#import "DadosUser.h"

@interface MenuViewController : ViewController  
@property (strong, nonatomic) IBOutlet FBProfilePictureView *imagemPerfil;
@property (strong, nonatomic) IBOutlet UITextView *nome;
@property (strong, nonatomic) IBOutlet UITextView *pontosUsuario;

@end
