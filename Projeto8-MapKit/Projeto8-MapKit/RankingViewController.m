//
//  RankingViewController.m
//  Projeto8-MapKit
//
//  Created by Felipe Teofilo on 20/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "RankingViewController.h"

@interface RankingViewController ()

@end

@implementation RankingViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [FBProfilePictureView class];
	[FBRequestConnection startWithGraphPath:@"661662543899386/scores"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error) {
         self.scores = result;
         NSLog(@"%@",self.scores);
         [self.tabelaRanking reloadData];
         
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.scores objectForKey:@"data"]count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Creates each cell for the table view.
    
    static NSString *cellID =  @"CELLID" ;
    
    UITableViewCell *cell = [self.tabelaRanking dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    NSLog(@"%@",self.scores);
    NSString *nomeDoUsuario = [[[[self.scores objectForKey:@"data"]objectAtIndex:indexPath.row ] objectForKey:@"user"]objectForKey:@"name"];
    int scoreDoUsuario =[[[[self.scores objectForKey:@"data"]objectAtIndex:indexPath.row] objectForKey:@"score"]intValue];
    
    NSString *usuario = [NSString stringWithFormat:@"%@ : %d",nomeDoUsuario,scoreDoUsuario];
    
    NSString *idDoUsuario= [[[[self.scores objectForKey:@"data"]objectAtIndex:indexPath.row] objectForKey:@"user"]objectForKey:@"id"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?width=100&height=100", idDoUsuario]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    [cell.imageView setImage:[UIImage imageWithData:data]];
    
    
    [cell.textLabel setText:usuario];
    
    return cell;
    
}


@end
