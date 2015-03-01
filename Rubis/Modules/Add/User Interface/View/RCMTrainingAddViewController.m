//
//  RCMTrainingAddViewController.m
//  Rubis
//
//  Created by Ricardo Caballero on 27/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMTrainingAddViewController.h"

#import "UIColor+Theme.h"

@interface RCMTrainingAddViewController ()

@property (nonatomic, weak) IBOutlet UIView *swimHeaderView;
@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet UIView *timeView;
@property (nonatomic, weak) IBOutlet UIView *distanceView;

@end

@implementation RCMTrainingAddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.containerView.backgroundColor = self.distanceView.backgroundColor = self.swimHeaderView.backgroundColor = [UIColor rb_redColor];
    self.timeView.backgroundColor = [UIColor rb_redDisabledColor];
    self.swimHeaderView.layer.cornerRadius = 5;
}

@end
