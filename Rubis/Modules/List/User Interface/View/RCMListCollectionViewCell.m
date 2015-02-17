//
//  RCMListCollectionViewCell.m
//  Rubis
//
//  Created by Ricardo Caballero on 15/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMListCollectionViewCell.h"

@implementation RCMListCollectionViewCell

- (void)setDate:(NSDate *)date
{
    _date = date;
    
    [self updateUI];
}

- (void)updateUI
{
    self.firstView.backgroundColor  = [self randomColor];
    self.centerView.backgroundColor = [self randomColor];
    self.lastView.backgroundColor   = [self randomColor];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd-MM-yy";
    
    self.dateLabel.text = [dateFormatter stringFromDate:self.date];
}

- (UIColor *)randomColor
{
    // Alternate cells between red and blue
    int random = arc4random() % 3;
    UIColor *color;
    if (random == 0) {
        color = [UIColor colorWithRed:0.988 green:0.266 blue:0.079 alpha:1.000];
    }
    else if (random == 1) {
        color = [UIColor colorWithRed:0.069 green:0.531 blue:0.750 alpha:1.000];
    }
    else if (random == 2) {
        color = [UIColor colorWithRed:0.976 green:0.002 blue:0.117 alpha:1.000];
    }
    
    return color;
}

@end
