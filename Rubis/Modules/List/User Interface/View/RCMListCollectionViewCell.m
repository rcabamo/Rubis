//
//  RCMListCollectionViewCell.m
//  Rubis
//
//  Created by Ricardo Caballero on 15/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMListCollectionViewCell.h"

#import "UIColor+Theme.h"

#import <PureLayout/PureLayout.h>

@implementation RCMListCollectionViewCell

- (void)setDate:(NSDate *)date
{
    _date = date;
    
    [self updateUI];
}

- (void)updateConstraints
{
    
    [self.contentView.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger index, BOOL *stop) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.backgroundColor = [self randomColor];
        
        // Height para cuando solo hay un elemento
        if (self.contentView.subviews.count == 1) {
            [view autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.contentView];
        }
        
        // Vertical
        if (index == 0) {
            [view autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView];
        }
        else {
            [view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.contentView.subviews[index - 1]];
            [view autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.contentView.subviews[index - 1]];
        }
        
        if (index == self.contentView.subviews.count - 1) {
            [view autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.contentView];
        }
        
        // Horizontal
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:NSDictionaryOfVariableBindings(view)]];
    }];
    
    [super updateConstraints];
}

- (void)updateUI
{
    for (UIView *subview in self.contentView.subviews) {
        [subview removeFromSuperview];
    }
    
    int views = (arc4random() % 3) + 1;
    
    for (int i =0; i < views; ++i) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:view];
    }
    
    [self setNeedsUpdateConstraints];
}

- (UIColor *)randomColor
{
    int x = (arc4random() % 3) + 1;
    
    switch (x) {
        case 0:
            return [UIColor rb_redColor];
            break;
            
        case 1:
            return [UIColor rb_blueColor];
            break;
            
        case 2:
            return [UIColor rb_orangeColor];
            break;
            
        default:
            return [UIColor grayColor];
            break;
    }
}


@end
