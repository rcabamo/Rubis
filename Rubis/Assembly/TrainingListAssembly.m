//
//  TrainingListAssembly.m
//  Rubis
//
//  Created by Ricardo Caballero on 14/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "TrainingListAssembly.h"
#import "ApplicationAssembly.h"

#import <Typhoon/Typhoon.h>

#import "RCMTrainingListWireframe.h"
#import "RCMListPresenter.h"
#import "RCMListViewController.h"

@interface TrainingListAssembly ()

@property (nonatomic, strong) ApplicationAssembly *applicationAssembly;

@end

@implementation TrainingListAssembly

- (id)trainingListWireframe
{
    return [TyphoonDefinition withClass:[RCMTrainingListWireframe class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(rootWireframe) with:[self.applicationAssembly rootWireframe]];
        [definition injectProperty:@selector(listViewController) with:[self listViewController]];
    }];
}

- (id)listViewController
{
    return [TyphoonDefinition withFactory:[self listViewStoryboard] selector:@selector(instantiateInitialViewController)];
}

- (id)listViewStoryboard
{
    return [TyphoonDefinition withClass:[TyphoonStoryboard class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(storyboardWithName:factory:bundle:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:NSStringFromClass([RCMListViewController class])];
            [initializer injectParameterWith:self];
            [initializer injectParameterWith:[NSBundle mainBundle]];
        }];
        
        definition.scope = TyphoonScopeSingleton;
    }];
}


@end
