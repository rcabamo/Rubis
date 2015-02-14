//
//  ApplicationAssembly.m
//  Rubis
//
//  Created by Ricardo Caballero on 14/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "ApplicationAssembly.h"

#import "TrainingListAssembly.h"

#import "AppDelegate.h"
#import "RCMRootWireframe.h"

@interface ApplicationAssembly ()

@property (nonatomic, strong) TrainingListAssembly* trainingListAssembly;

@end

@implementation ApplicationAssembly

- (id)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(listWireframe) with:[self.trainingListAssembly trainingListWireframe]];
    }];
}

- (id)rootWireframe
{
    return [TyphoonDefinition withClass:[RCMRootWireframe class]];
}

@end
