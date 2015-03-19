//
//  HomeAssembly.m
//  Rubis
//
//  Created by Ricardo Caballero on 19/3/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "HomeAssembly.h"
#import "ApplicationAssembly.h"
#import "TrainingListAssembly.h"

#import <Typhoon/Typhoon.h>

#import "RCMHomeWireframe.h"
#import "RCMHomePresenter.h"
#import "RCMHomeViewController.h"

@interface HomeAssembly ()

@property (nonatomic, strong) ApplicationAssembly   *applicationAssembly;
@property (nonatomic, strong) TrainingListAssembly  *listAssembly;

@end

@implementation HomeAssembly

- (id)homeWireframe
{
    return [TyphoonDefinition withClass:[RCMHomeWireframe class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(rootWireframe) with:[self.applicationAssembly rootWireframe]];
        [definition injectProperty:@selector(listWireframe) with:[self.listAssembly trainingListWireframe]];
        [definition injectProperty:@selector(homePresenter) with:[self homePresenter]];
        [definition injectProperty:@selector(homeViewController) with:[self homeViewController]];
    }];
}

- (id)homePresenter
{
    return [TyphoonDefinition withClass:[RCMHomePresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(homeWireframe) with:[self homeWireframe]];
        [definition injectProperty:@selector(homeViewController) with:[self homeViewController]];
    }];
}

- (id)homeViewController
{
    TyphoonDefinition *definition = [TyphoonDefinition withFactory:[self homeViewStoryboard] selector:@selector(instantiateInitialViewController)];
    
    [definition injectProperty:@selector(presenter) with:[self homePresenter]];
    
    return definition;
}

- (id)homeViewStoryboard
{
    return [TyphoonDefinition withClass:[TyphoonStoryboard class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(storyboardWithName:factory:bundle:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:NSStringFromClass([RCMHomeViewController class])];
            [initializer injectParameterWith:self];
            [initializer injectParameterWith:[NSBundle mainBundle]];
        }];
        
        definition.scope = TyphoonScopeSingleton;
    }];
}


@end
