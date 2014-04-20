//
//  MenuViewController.m
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [FBProfilePictureView class];
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            
            self.imagemPerfil.profileID = [result id];
            [self.nome setText:[result name]];
        
        } else {
            
        }
    }];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
