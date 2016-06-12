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
@property (nonatomic, readonly) KSFriendsDetailView *rootView;

@end

@implementation KSFriendDetailViewController

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
            [rootView removeLoadingViewAnimated:YES];
        }
                    state:kKSUserStateLoaded
                   object:self];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)load {
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    KSFriendDetailContext *context = [[KSFriendDetailContext alloc] initWithUser:self.user];
    [context performWork];
    [self.rootView fillWithUser:self.user];
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self load];
}

@end
