//
//  KSFriendDetailViewController.m
//  KSIdapStudy
//
//  Created by KulikovS on 08.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSFriendDetailViewController.h"
#import "KSFriendsDetailView.h"
#import "KSUser.h"

@interface KSFriendDetailViewController ()
@property (nonatomic, readonly) KSFriendsDetailView *rootView;

@end

@implementation KSFriendDetailViewController


#pragma mark -
#pragma mark Accessors

KSRootViewAndReturnNilMacro(KSFriendsDetailView);


- (void)setUser:(KSUser *)user {

}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

@end
