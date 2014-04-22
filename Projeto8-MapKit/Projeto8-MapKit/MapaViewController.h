//
//  MapaViewController.h
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 21/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalPickerView.h"

@interface MapaViewController : ViewController <UIPickerViewDelegate>


@property (strong, nonatomic) IBOutlet HorizontalPickerView *categorias;

@end

