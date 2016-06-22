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

@interface KSUserPhotosController ()
@property (nonatomic, readonly) KSUserPhotosView   *rootView;
@property (nonatomic, strong)   NSMutableArray     *photos;

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

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

#pragma mark -
#pragma mark UICollectionViewDataSource Protool

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KSUserCollectionViewCell *cell = [collectionView dequeueReusableCellFromNibWithClass:[KSUserCollectionViewCell class]];
   [cell fillWithPhotos:self.photos[indexPath]];
    
    
    return cell;
}


@end
