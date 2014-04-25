//
//  MedalhaViewController.h
//  Projeto8-MapKit
//
//  Created by LEONARDO DE SOUSA MENDES on 22/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ViewController.h"
#import "DadosUser.h"
#import "Medalha.h"

#define MEDALHASLINHA 5;

@interface MedalhaViewController : ViewController <DadosUser>


{
    int contMedalhas;
    int medalhasAdicionadas;
    float posXUsar;
    float posYUsar;
}

@property (weak, nonatomic) UIView *viewParte1;
@property (weak, nonatomic) UIView *viewParte2;

@end
