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

static int i = 0;
NSInteger selectedIndex = 3;


@interface RCMListViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UICollectionView   *collectionView;
//
@end

@implementation RCMListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
    
//    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:5 inSection:0]   atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10 + i;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RCMListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RCMListCollectionViewCell class]) forIndexPath:indexPath];
    
    cell.date = nil;
    
    return cell;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x + CGRectGetWidth(self.collectionView.frame) + 50 > scrollView.contentSize.width) {
        NSLog(@"Load new objects");
        i += 5;
        [self.collectionView reloadData];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSArray *cells = self.collectionView.visibleCells;
    
    UICollectionViewCell *cell = cells[cells.count/2];
    
    [self.collectionView scrollToItemAtIndexPath:[self.collectionView indexPathForCell:cell] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

@end
