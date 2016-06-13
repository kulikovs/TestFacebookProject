//
//  KSFriendDetailContext.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 12.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "KSFriendDetailContext.h"
#import "KSUser.h"
#import "KSFacebookConstants.h"

@implementation KSFriendDetailContext

#pragma mark -
#pragma mark Accessors

-(NSDictionary *)requestParameters {
    return kKSUserRequestParameters;
}

#pragma mark -
#pragma mark Public methods

- (void)parsingFromResult:(id)result {
    self.user.firstName = [result  valueForKey:kKSFirstNameKey];
    self.user.lastName = [result valueForKey:kKSLastNameKey];
    self.user.gender = [result  valueForKey:kKSUserGenderKey];    
}

@end
