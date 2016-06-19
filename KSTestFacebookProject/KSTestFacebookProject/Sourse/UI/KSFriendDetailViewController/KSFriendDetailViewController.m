//
//  KSFriendDetailViewController.m
//  KSIdapStudy
//
//  Created by KulikovS on 08.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "KSFriendDetailViewController.h"
#import "KSFriendsDetailView.h"
#import "KSFriendDetailContext.h"
#import "KSUserModel.h"
#import "KSStateModel.h"

static NSString * const kKSDetailFriendBarTitle       = @"Detailed Info";
static NSString * const kKSLeftBarBattonImageName     = @"BackButton1";
static NSString * const kKSRightBarBattonImageName    = @"home";

@interface KSFriendDetailViewController ()
@property (nonatomic, readonly) KSFriendsDetailView     *rootView;

@end

@implementation KSFriendDetailViewController

@dynamic rootView;

#pragma mark -
#pragma mark Accessors

KSRootViewAndReturnNilMacro(KSFriendsDetailView);

- (void)setUser:(KSUserModel *)user {
    [super setUser:user];
    
      self.context = [[KSFriendDetailContext alloc] initWithUser:user];
}

- (NSString *)navigationBarTitle {
    return kKSDetailFriendBarTitle;
}

- (NSString *)imageNameForLeftButton {
    return kKSLeftBarBattonImageName;
}

- (NSString *)imageNameForRightButton {
    return kKSRightBarBattonImageName;
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

#pragma mark -
#pragma mark Public Methods

- (void)contextDidLoad {
    KSFriendsDetailView *rootView = self.rootView;
    [self.rootView fillWithUser:self.user];
    [rootView removeLoadingViewAnimated:NO];
}

- (void)clickRightBarButton {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
