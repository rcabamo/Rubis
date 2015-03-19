//
//  ApplicationAssembly.m
//  Rubis
//
//  Created by Ricardo Caballero on 14/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "ApplicationAssembly.h"

#import "HomeAssembly.h"

#import "AppDelegate.h"
#import "RCMRootWireframe.h"

@interface ApplicationAssembly ()

@property (nonatomic, strong) HomeAssembly* homeAssembly;

@end

@implementation ApplicationAssembly

- (id)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(homeWireframe) with:[self.homeAssembly homeWireframe]];
    }];
}

- (id)rootWireframe
{
    return [TyphoonDefinition withClass:[RCMRootWireframe class]];
}

@end
