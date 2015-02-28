//
//  RCMListPresenter.m
//  Rubis
//
//  Created by Ricardo Caballero on 14/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMListPresenter.h"

#import "RCMTrainingListWireframe.h"
#import "RCMListViewController.h"

@interface RCMListPresenter ()

@property (nonatomic, strong) RCMTrainingListWireframe          *listWireframe;
@property (nonatomic, strong) RCMListViewController             *listViewController;

@end

@implementation RCMListPresenter

- (void)openAddViewWithDate:(NSDate *)date
{
    [self.listWireframe presentAddTrainingWireframeForDate:date];
}

@end
