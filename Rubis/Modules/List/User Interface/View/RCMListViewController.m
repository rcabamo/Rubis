//
//  RCMListViewController.m
//  Rubis
//
//  Created by Ricardo Caballero on 14/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMListViewController.h"

#import "RCMListCollectionViewCell.h"

const CGFloat kScaleBoundLower = 0.5;
const CGFloat kScaleBoundUpper = 2.0;

@interface RCMListViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UICollectionView   *collectionView;
@property (nonatomic, strong) UIPinchGestureRecognizer  *gesture;
@property (nonatomic,assign) CGFloat                    scale;

@end

@implementation RCMListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"RCMListViewController";
    
    // Default scale is the average between the lower and upper bound
    self.scale = (kScaleBoundUpper + kScaleBoundLower)/2.0;
    
    // Add the pinch to zoom gesture
    self.gesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(didReceivePinchGesture:)];
    [self.collectionView addGestureRecognizer:self.gesture];
}


#pragma mark - Accessors
- (void)setScale:(CGFloat)scale
{
    // Make sure it doesn't go out of bounds
    if (scale < kScaleBoundLower)
    {
        _scale = kScaleBoundLower;
    }
    else if (scale > kScaleBoundUpper)
    {
        _scale = kScaleBoundUpper;
    }
    else
    {
        _scale = scale;
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 300;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RCMListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RCMListCollectionViewCell class]) forIndexPath:indexPath];
    
    [cell setDate:[NSDate date]];
    
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Main use of the scale property
    CGFloat scaledWidth = 50 * self.scale;
   return CGSizeMake(scaledWidth, CGRectGetHeight(self.collectionView.frame));
}


#pragma mark - Gesture Recognizers
- (void)didReceivePinchGesture:(UIPinchGestureRecognizer*)gesture
{
    static CGFloat scaleStart;
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        // Take an snapshot of the initial scale
        scaleStart = self.scale;
        return;
    }
    if (gesture.state == UIGestureRecognizerStateChanged)
    {
        // Apply the scale of the gesture to get the new scale
        self.scale = scaleStart * gesture.scale;
        
        if (NO)
        {
            // Animated zooming (remove and re-add the gesture recognizer to prevent updates during the animation)
            [self.collectionView removeGestureRecognizer:self.gesture];
            UICollectionViewFlowLayout *newLayout = [[UICollectionViewFlowLayout alloc] init];
            [self.collectionView setCollectionViewLayout:newLayout animated:YES completion:^(BOOL finished) {
                [self.collectionView addGestureRecognizer:self.gesture];
            }];
        }
        else
        {
            // Invalidate layout
            [self.collectionView.collectionViewLayout invalidateLayout];
        }
    }
}



@end
