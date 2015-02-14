//
//  RCMTrainingListWireframe.m
//  Rubis
//
//  Created by Ricardo Caballero on 14/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMTrainingListWireframe.h"

#import "RCMRootWireframe.h"

#import "RCMListViewController.h"

@interface RCMTrainingListWireframe ()
@property (nonatomic, strong) RCMRootWireframe      *rootWireframe;
@property (nonatomic, strong) RCMListViewController *listViewController;
@end

@implementation RCMTrainingListWireframe

- (instancetype)init
{
    if (self == [super init]) {
        
    }
    
    return self;
}


#pragma mark - Getters && Setters

- (RCMRootWireframe *)rootWireframe
{
    if (!_rootWireframe) {
        _rootWireframe = [[RCMRootWireframe alloc] init];
    }
    
    return _rootWireframe;
}

- (RCMListViewController *)listViewController
{
    if (!_listViewController) {
        _listViewController = [[UIStoryboard storyboardWithName:@"RCMListViewController" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    }
    
    return _listViewController;
}

- (void)presentListInterfaceFromWindow:(UIWindow *)window
{
    [self.rootWireframe showRootViewController:self.listViewController inWindow:window];
}

@end
