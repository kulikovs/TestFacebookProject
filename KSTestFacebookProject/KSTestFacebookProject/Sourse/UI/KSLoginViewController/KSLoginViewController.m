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
#import "FBSDKAccessToken.h"

#import "KSLoginViewController.h"
#import "KSLoginView.h"
#import "KSFriendsViewController.h"
#import "KSFacebookConstants.h"
#import "KSUserModel.h"

@interface KSLoginViewController ()
@property (nonatomic, strong)   KSFriendsViewController *friendsViewControler;
@property (nonatomic, readonly) KSLoginView             *rootView;
@property (nonatomic, strong)   KSUserModel             *user;


- (void)setUserWithID:(NSString *)IDString;
@end

@implementation KSLoginViewController

@dynamic rootView;

#pragma mark -
#pragma mark Accessors

KSRootViewAndReturnNilMacro(KSLoginView);

//- (void)setUser:(KSUserModel *)user {
//    [super setUser:user];
//        user.isLogedIn = YES;
//
//        KSFriendsViewController *viewController = self.friendsViewControler;
//        viewController.user = user;
//        [self.navigationController pushViewController:viewController animated:YES];
//}


- (void)setUser:(KSUserModel *)user {
    if (_user != user) {
        _user = user;
        
        _user.isLogedIn = YES;
        
        KSFriendsViewController *viewController = self.friendsViewControler;
        viewController.user = _user;
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark -
#pragma mark Private Methods

- (void)setUserWithID:(NSString *)IDString {
    KSUserModel *user = [KSUserModel objectWithID:IDString];
    self.user = user;
}


#pragma mark -
#pragma mark Handling

- (IBAction)onClickLoginButton:(id)sender {
    FBSDKAccessToken *accesstoken = [FBSDKAccessToken currentAccessToken];
    self.friendsViewControler = [KSFriendsViewController new];
    if (accesstoken.tokenString) {
        [self setUserWithID:accesstoken.userID];
    } else {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logInWithReadPermissions:kKSLogInPermissions
                     fromViewController:self
                                handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                    if (!error && result.token) {
                                        [self setUserWithID:result.token.userID];
                                    }
                                }];
    }
}



@end
