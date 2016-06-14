//
//  KSFriendDetailViewController.m
//  KSIdapStudy
//
//  Created by KulikovS on 08.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSFriendDetailViewController.h"
#import "KSFriendsDetailView.h"
#import "KSFriendDetailContext.h"
#import "KSUser.h"
#import "KSStateModel.h"

@interface KSFriendDetailViewController ()
@property (nonatomic, readonly) KSFriendsDetailView     *rootView;
@property (nonatomic, strong)   KSFriendDetailContext   *detailContext;

@end

@implementation KSFriendDetailViewController

@dynamic rootView;

#pragma mark -
#pragma mark Accessors

KSRootViewAndReturnNilMacro(KSFriendsDetailView);

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        _user = user;
        
        KSWeakifySelf;
        [_user addHandler:^(KSStateModel *object) {
            KSStrongifySelfWithClass(KSFriendDetailViewController);
            KSFriendsDetailView *rootView = strongSelf.rootView;
            [strongSelf.rootView fillWithUser:strongSelf.user];
            [rootView removeLoadingViewAnimated:NO];
        }
                    state:kKSModelStateLoaded
                   object:self];
        
      self.detailContext = [[KSFriendDetailContext alloc] initWithUser:_user];
    }
}

- (void)setDetailContext:(KSFriendDetailContext *)detailContext {
    if (_detailContext != detailContext) {
        [_detailContext cancel];
        _detailContext = detailContext;
        [_detailContext execute];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self load];
}

#pragma mark -
#pragma mark Private Methods

- (void)load {
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

@end
