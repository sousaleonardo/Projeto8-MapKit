//
//  InformacoesViewController.m
//  Projeto8-MapKit
//
//  Created by FELIPE TEOFILO SOUZA SANTOS on 23/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "InformacoesViewController.h"
#import "Lugares.h"

@interface InformacoesViewController ()

@end

@implementation InformacoesViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.nomeLocal setText:self.atracao.title];
    [self.precoLocal setText:[NSString stringWithFormat:@"Preço: %@",self.atracao.subtitle ]];
    [self.informacoesLocal setText:self.atracao.descricao];
    [self.enderecoLocal setText:self.atracao.endereco];
    [self.informacoesLocal setEditable:NO];
    [self.informacoesLocal setTextAlignment:NSTextAlignmentJustified];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
