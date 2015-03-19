//
//  AppDelegate.h
//  Rubis
//
//  Created by Ricardo Caballero on 12/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCMHomeWireframe;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) RCMHomeWireframe *homeWireframe;

@end

