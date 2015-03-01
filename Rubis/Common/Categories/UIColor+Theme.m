//
//  UIColor+Theme.m
//  Rubis
//
//  Created by Ricardo Caballero on 24/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "UIColor+Theme.h"

@implementation UIColor (Theme)

+ (UIColor *)rb_redColor
{
    return [UIColor colorWithRed:1.000 green:0.310 blue:0.361 alpha:1.000];
}

+ (UIColor *)rb_redDisabledColor;
{
    return [UIColor colorWithRed:0.941 green:0.263 blue:0.306 alpha:1.000];
}

+ (UIColor *)rb_blueColor
{
    return [UIColor colorWithRed:0.000 green:0.635 blue:0.855 alpha:1.000];
}

+ (UIColor *)rb_blueDisabledColor
{
    return [UIColor colorWithRed:0.000 green:0.569 blue:0.780 alpha:1.000];
}

+ (UIColor *)rb_orangeColor
{
    return [UIColor colorWithRed:1.000 green:0.741 blue:0.376 alpha:1.000];
}

+ (UIColor *)rb_orangeDisabledColor
{
    return [UIColor colorWithRed:0.980 green:0.686 blue:0.333 alpha:1.000];
}

+ (UIColor *)rb_grayColor
{
    return [UIColor colorWithWhite:0.584 alpha:1.000];
}

+ (UIColor *)rb_grayDisabledColor
{
    return [UIColor colorWithWhite:0.533 alpha:1.000];
}

+ (UIColor *)rb_blackColor
{
    return [UIColor colorWithWhite:0.153 alpha:1.000];
}

@end
