//
//  DateListCollectionFlowLayout.m
//  Rubis
//
//  Created by Ricardo Caballero on 19/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "DateListCollectionFlowLayout.h"

@interface DateListCollectionFlowLayout ()

@property (nonatomic) CGFloat offset;

@end

@implementation DateListCollectionFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    [self commonInit];
}

- (void)commonInit
{
    self.offset = 50;
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 5;
    self.itemSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame) / 2, CGRectGetHeight(self.collectionView.frame) - self.offset);
    self.sectionInset = UIEdgeInsetsZero;
    self.headerReferenceSize = self.footerReferenceSize = CGSizeZero;
}


- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    for (UICollectionViewLayoutAttributes *itemAttributes in attributes) {
        if (itemAttributes.representedElementKind==UICollectionElementCategoryCell) {
            
            CGFloat distanceFromCenterX = itemAttributes.center.x - self.collectionView.contentOffset.x;
            distanceFromCenterX = ABS(distanceFromCenterX - CGRectGetWidth(self.collectionView.frame)/2);
            distanceFromCenterX = distanceFromCenterX / (CGRectGetWidth(self.collectionView.frame)/2);
            
            CGFloat yOffset = self.offset * (distanceFromCenterX);
            
            itemAttributes.frame = CGRectMake(itemAttributes.frame.origin.x, yOffset, CGRectGetWidth(itemAttributes.frame), CGRectGetHeight(self.collectionView.frame) - yOffset);
        }
    }

    return attributes;
}

@end
