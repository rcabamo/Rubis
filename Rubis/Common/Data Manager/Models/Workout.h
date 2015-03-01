//
//  Workout.h
//  Rubis
//
//  Created by Ricardo Caballero on 1/3/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import <Realm/Realm.h>

#import "Training.h"

@interface Workout : RLMObject

@property NSDate *date;
@property RLMArray<Training> *trainings;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Workout>
RLM_ARRAY_TYPE(Workout)
