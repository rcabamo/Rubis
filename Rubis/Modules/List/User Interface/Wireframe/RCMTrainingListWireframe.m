//
//  RCMTrainingListWireframe.m
//  Rubis
//
//  Created by Ricardo Caballero on 14/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMTrainingListWireframe.h"

#import "RCMRootWireframe.h"
#import "RCMTrainingAddWireframe.h"
#import "RCMListPresenter.h"
#import "RCMListViewController.h"

@interface RCMTrainingListWireframe ()

@property (nonatomic, strong) RCMRootWireframe          *rootWireframe;
@property (nonatomic, strong) RCMTrainingAddWireframe   *addWireframe;
@property (nonatomic, strong) RCMListPresenter          *listPresenter;
@property (nonatomic, strong) RCMListViewController     *listViewController;

@end

@implementation RCMTrainingListWireframe

- (void)presentListInterfaceFromWindow:(UIWindow *)window
{
    [self.rootWireframe showRootViewController:self.listViewController inWindow:window];
}

@end
