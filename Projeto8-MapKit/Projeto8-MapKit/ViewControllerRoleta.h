//
//  ViewControllerRoleta.h
//  Projeto8-MapKit
//
//  Created by Júlia Yamamoto on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControleRoleta.h"
#import "RoletaProtocol.h"

@interface ViewControllerRoleta : UIViewController <RoletaProtocol>

@property (nonatomic, strong) IBOutlet UILabel *lblCategoriaAtual;
@property ControleRoleta *roleta;


@end
