//
//  RCMHomeViewController.m
//  Rubis
//
//  Created by Ricardo Caballero on 19/3/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMHomeViewController.h"

#import "RCMHomePresenter.h"

@interface RCMHomeViewController ()

@property (nonatomic, strong) RCMHomePresenter          *presenter;

@end

@implementation RCMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)openCalculator:(id)sender
{
    [self.presenter openCalculatorView];
}

- (IBAction)openWorkout:(id)sender
{
    [self.presenter openWorkoutView];
}


@end
