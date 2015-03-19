//
//  RCMHomePresenter.m
//  Rubis
//
//  Created by Ricardo Caballero on 19/3/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMHomePresenter.h"

#import "RCMHomeWireframe.h"
#import "RCMHomeViewController.h"

@interface RCMHomePresenter ()

@property (nonatomic, strong) RCMHomeWireframe          *homeWireframe;
@property (nonatomic, strong) RCMHomeViewController     *homeViewController;

@end

@implementation RCMHomePresenter

- (void)openCalculatorView
{
    
}

- (void)openWorkoutView
{
    [self.homeWireframe presentListTrainingWireframe];
}

@end
