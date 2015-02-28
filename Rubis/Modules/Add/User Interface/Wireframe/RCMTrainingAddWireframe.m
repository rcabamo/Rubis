//
//  RCMTrainingAddWireframe.m
//  Rubis
//
//  Created by Ricardo Caballero on 27/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMTrainingAddWireframe.h"

#import "RCMRootWireframe.h"
#import "RCMTrainingAddPresenter.h"
#import "RCMTrainingAddViewController.h"

@interface RCMTrainingAddWireframe ()

@property (nonatomic, strong) RCMTrainingAddPresenter       *addPresenter;
@property (nonatomic, strong) RCMRootWireframe              *rootWireframe;
@property (nonatomic, strong) RCMTrainingAddViewController  *addViewController;

@end

@implementation RCMTrainingAddWireframe

- (void)presentAddViewWithDate:(NSDate *)date viewController:(UINavigationController *)viewController
{
    [viewController pushViewController:self.addViewController animated:YES];
}

@end
