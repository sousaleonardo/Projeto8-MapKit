//
//  AppDelegate.m
//  Projeto8-MapKit
//
//  Created by LEONARDO DE SOUSA MENDES on 16/04/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [FBLoginView class];
    
    
    //Adiciona no Parse o AppID e ClienteKey para autenticar ao serviço
    [Parse setApplicationId:@"NqcQibuUFOv31C9GEgGgX6CGC4PkRdgrmMufNbCq" clientKey:@"35lUV8WFSGImAEehmZ3Nv9paqinvJ6L0Jzn2L47C"];
    
    //
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    [PFFacebookUtils initializeFacebook];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    [PFFacebookUtils handleOpenURL:url];
    
    //return wasHandled;
    
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication withSession:[PFFacebookUtils session]];
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [PFFacebookUtils handleOpenURL:url];
}

-(void)applicationDidBecomeActive:(UIApplication *)application{
    //Quando o app ficar ativo pega a sessão do fb
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}
@end
