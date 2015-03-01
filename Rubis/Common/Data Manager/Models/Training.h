//
//  Training.h
//  Rubis
//
//  Created by Ricardo Caballero on 1/3/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import <Realm/Realm.h>

@interface Training : RLMObject

@property NSTimeInterval    duration;
@property float             distance;
@property NSString          *details;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Training>
RLM_ARRAY_TYPE(Training)
