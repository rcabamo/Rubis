//
//  RCMListViewController.m
//  Rubis
//
//  Created by Ricardo Caballero on 14/2/15.
//  Copyright (c) 2015 Ricardo Caballero. All rights reserved.
//

#import "RCMListViewController.h"

#import "RCMListCollectionViewCell.h"

#import "UIColor+Theme.h"

NSInteger selectedIndex = 3;


@interface RCMListViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>
{
    NSInteger listOffset;
    NSInteger amountInitValue;
}

@property (nonatomic, weak) IBOutlet UICollectionView   *collectionView;
//
@end

@implementation RCMListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    amountInitValue = 10;
    
    self.title = NSStringFromClass([self class]);
    self.navigationController.navigationBar.translucent = NO;
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    
    [navigationBar setBackgroundImage:[UIImage new]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    
    [navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.barTintColor = [UIColor rb_blackColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor rb_redColor]};
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self updateCollectionViewPosition];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return amountInitValue + listOffset;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RCMListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RCMListCollectionViewCell class]) forIndexPath:indexPath];
    
    NSInteger offset = indexPath.row - (amountInitValue+listOffset/2);
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:offset*24*60*60];
    NSLog(@"date: %@", date);
    
    cell.date = date;
    
    return cell;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x + CGRectGetWidth(self.collectionView.frame) * 2 > scrollView.contentSize.width ||
        scrollView.contentOffset.x < 75) {
        NSLog(@"Load new objects");
        listOffset += 20;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            
            if (scrollView.contentOffset.x < 75) {
                [self updateCollectionViewPosition];
            }
        });
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSArray *cells = self.collectionView.visibleCells;
//    
//    UICollectionViewCell *cell = cells[cells.count/2];
//    
//    [self.collectionView scrollToItemAtIndexPath:[self.collectionView indexPathForCell:cell] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    [self updateCollectionViewPosition];
    return NO;
}


#pragma mark - Utils method

- (void)updateCollectionViewPosition
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:(amountInitValue+listOffset)/2 inSection:0];
        [self.collectionView scrollToItemAtIndexPath:indexPath   atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    });
}

@end
