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
#import "KSUserModel.h"
#import "KSFacebookConstants.h"

@implementation KSFriendDetailContext

#pragma mark -
#pragma mark Accessors

-(NSDictionary *)requestParameters {
    return kKSUserRequestParameters;
}

#pragma mark -
#pragma mark Public methods

- (void)parseResult:(id)result {
    self.user.gender = [result  valueForKey:kKSUserGenderKey];    
}

@end
