//
//  RCMHomeWireframe.m
//  Rubis
//
//  Created by Ricardo Caballero on 19/3/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMHomeWireframe.h"

#import "RCMRootWireframe.h"
#import "RCMTrainingListWireframe.h"
#import "RCMHomePresenter.h"
#import "RCMHomeViewController.h"

@interface RCMHomeWireframe ()

@property (nonatomic, strong) RCMRootWireframe              *rootWireframe;
@property (nonatomic, strong) RCMTrainingListWireframe      *listWireframe;
@property (nonatomic, strong) RCMHomePresenter              *homePresenter;
@property (nonatomic, strong) RCMHomeViewController         *homeViewController;

@end

@implementation RCMHomeWireframe

- (void)presentHomeInterfaceFromWindow:(UIWindow *)window
{
    [self.rootWireframe showRootViewController:self.homeViewController inWindow:window];
}

- (void)presentListTrainingWireframe
{
    [self.listWireframe presentListViewWithviewController:self.homeViewController];
}

@end
