//
//  KSLoginViewController.m
//  KSIdapStudy
//
//  Created by KulikovS on 08.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "KSLoginViewController.h"
#import "KSLoginView.h"
#import "KSFriendsViewController.h"
#import "KSUser.h"
#import "KSUserContext.h"

#define kKSLogInPermissions @[@"public_profile", @"email", @"user_friends"]

@interface KSLoginViewController ()
@property (nonatomic, readonly) KSLoginView *rootView;

@end

@implementation KSLoginViewController

#pragma mark -
#pragma mark Accessors

KSRootViewAndReturnNilMacro(KSLoginView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

     self.rootView.loginButton = [[FBSDKLoginButton alloc] init];
}

- (IBAction)onClickLoginButton:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:kKSLogInPermissions
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (!error && result.token) {
            KSFriendsViewController *friendsViewControler = [KSFriendsViewController new];
             KSUser *user = [[KSUser alloc] initWithID:result.token.userID isLogedIn:YES];
             friendsViewControler.user = user;
             [self.navigationController pushViewController:friendsViewControler animated:YES];
         }
     }];
}

@end
