//
//  TrainingAddAssembly.m
//  Rubis
//
//  Created by Ricardo Caballero on 27/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "TrainingAddAssembly.h"
#import "ApplicationAssembly.h"

#import <Typhoon/Typhoon.h>

#import "RCMTrainingAddWireframe.h"
#import "RCMTrainingAddPresenter.h"
#import "RCMTrainingAddViewController.h"

@interface TrainingAddAssembly ()

@property (nonatomic, strong) ApplicationAssembly *applicationAssembly;

@end

@implementation TrainingAddAssembly

- (id)trainingAddWireframe
{
    return [TyphoonDefinition withClass:[RCMTrainingAddWireframe class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(addPresenter) with:[self addPresenter]];
        [definition injectProperty:@selector(rootWireframe) with:[self.applicationAssembly rootWireframe]];
        [definition injectProperty:@selector(addViewController) with:[self addViewController]];
    }];
}

- (id)addPresenter
{
    return [TyphoonDefinition withClass:[RCMTrainingAddPresenter class]];
}

- (id)addViewController
{
    return [TyphoonDefinition withFactory:[self addViewStoryboard] selector:@selector(instantiateInitialViewController)];
}

- (id)addViewStoryboard
{
    return [TyphoonDefinition withClass:[TyphoonStoryboard class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(storyboardWithName:factory:bundle:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:NSStringFromClass([RCMTrainingAddViewController class])];
            [initializer injectParameterWith:self];
            [initializer injectParameterWith:[NSBundle mainBundle]];
        }];
        
        definition.scope = TyphoonScopeSingleton;
    }];
}


@end
