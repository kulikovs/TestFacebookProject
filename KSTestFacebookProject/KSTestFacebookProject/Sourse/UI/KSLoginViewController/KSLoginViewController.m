//
//  KSLoginViewController.m
//  KSIdapStudy
//
//  Created by KulikovS on 08.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "IDPActiveRecordKit.h"

#import "KSLoginViewController.h"
#import "KSLoginView.h"
#import "KSFriendsViewController.h"
#import "KSUser.h"
#import "KSFacebookConstants.h"
#import "KSUserModel.h"

@interface KSLoginViewController ()
@property (nonatomic, readonly) KSLoginView *rootView;

@end

@implementation KSLoginViewController

@dynamic rootView;

#pragma mark -
#pragma mark Accessors

KSRootViewAndReturnNilMacro(KSLoginView);

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark -
#pragma mark Handling

- (IBAction)onClickLoginButton:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:kKSLogInPermissions
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (!error && result.token) {
            KSFriendsViewController *friendsViewControler = [KSFriendsViewController new];
//             KSUserModel *user = [KSUserModel managedObject];
//             [user setCustomValue:result.token.userID forKey:@"id"];
//             [user setCustomValue:@"YES" forKey:@"isLogedIn"];
//             [user saveManagedObject];
             //
             
             KSUser *user = [[KSUser alloc] initWithID:result.token.userID];
             user.isLogedIn = YES;
             friendsViewControler.user = user;
             
             [self.navigationController pushViewController:friendsViewControler animated:YES];
         }
     }];
}

@end
