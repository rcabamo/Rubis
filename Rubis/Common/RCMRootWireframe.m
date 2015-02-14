//
//  RCMRootWireframe.m
//  Rubis
//
//  Created by Ricardo Caballero on 14/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMRootWireframe.h"

@implementation RCMRootWireframe

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window
{
    UINavigationController *navController = [self navigationControllerFromWindow:window];
    navController.viewControllers = @[viewController];
}

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    UINavigationController *navController = (UINavigationController *)window.rootViewController;
    if (!navController) {
        navController = [[UINavigationController alloc] init];
        window.rootViewController = navController;
    }
    
    return navController;
}

@end
