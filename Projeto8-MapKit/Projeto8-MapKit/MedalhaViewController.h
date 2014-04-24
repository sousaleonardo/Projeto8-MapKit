//
//  MedalhaViewController.h
//  Projeto8-MapKit
//
//  Created by LEONARDO DE SOUSA MENDES on 22/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ViewController.h"
#import "DadosUser.h"

@interface MedalhaViewController : ViewController <DadosUser>



@property (weak, nonatomic) IBOutlet UIButton *teste;

-(IBAction)salvarLugar:(id)sender;


@end
