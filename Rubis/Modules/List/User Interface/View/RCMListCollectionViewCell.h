//
//  RCMListCollectionViewCell.h
//  Rubis
//
//  Created by Ricardo Caballero on 15/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCMListCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIView     *firstView;
@property (nonatomic, weak) IBOutlet UIView     *centerView;
@property (nonatomic, weak) IBOutlet UIView     *lastView;

@property (nonatomic, weak) IBOutlet UILabel    *dateLabel;

@property (nonatomic, strong) NSDate            *date;

@end
