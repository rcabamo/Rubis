//
//  Workout.m
//  Rubis
//
//  Created by Ricardo Caballero on 1/3/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "Workout.h"

@implementation Workout

+ (NSString *)primaryKey {
    return @"date";
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
