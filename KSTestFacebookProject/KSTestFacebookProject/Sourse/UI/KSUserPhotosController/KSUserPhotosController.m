//
//  KSUserPhotosControllerViewController.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 22.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSUserPhotosController.h"
#import "KSUserPhotosContext.h"
#import "KSUserPhotosView.h"
#import "KSUserCollectionViewCell.h"

static NSString * const kKSUserPhotosTitle          = @"User Photos";
static NSString * const kKSLeftBurBattonImageName   = @"BackButton1";
static NSString * const kKSRightBarBattonImageName  = @"home";

@interface KSUserPhotosController ()
@property (nonatomic, readonly) KSUserPhotosView   *rootView;
@property (nonatomic, strong)   NSArray            *photos;

@end

@implementation KSUserPhotosController

@dynamic rootView;

#pragma mark -
#pragma mark Accessors

KSRootViewAndReturnNilMacro(KSUserPhotosView);

- (void)setUser:(KSUserModel *)user {
    [super setUser:user];
    
    self.context = [[KSUserPhotosContext alloc] initWithUser:self.user];
}

- (NSString *)navigationBarTitle {
    return kKSUserPhotosTitle;
}

- (NSString *)imageNameForLeftButton {
    return kKSLeftBurBattonImageName;
}

- (void)setPhotos:(NSArray *)photos {
    if (_photos != photos) {
        _photos = photos;
        
        [self.rootView.collectionView reloadData];
    }
}

- (NSString *)imageNameForRightButton {
    return kKSRightBarBattonImageName;
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView.collectionView registerCollectionViewCellWithClass:[KSUserCollectionViewCell class]];
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

#pragma mark -
#pragma mark - Public Methods

- (void)contextDidLoad {
    self.photos = [self.user.photos allObjects];
   [self.rootView removeLoadingViewAnimated:YES];
}

- (void)rightBarButtonClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark UICollectionViewDataSource Protool

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KSUserCollectionViewCell *cell = [collectionView
                                      dequeueReusableCellFromNibWithClass:[KSUserCollectionViewCell class]
                                      indexPath:indexPath];
    
    [cell fillWithPhoto:self.photos[indexPath.row]];
    
    return cell;
}

@end
