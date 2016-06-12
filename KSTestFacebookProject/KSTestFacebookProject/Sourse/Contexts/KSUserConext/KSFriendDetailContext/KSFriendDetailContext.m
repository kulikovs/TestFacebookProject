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
#pragma mark Private methods

//- (void)parsingFromResultArray:(NSArray *)resultArray {
//    
//    
//    for (NSDictionary *dictionary in resultArray) {
//        NSString *id = [dictionary  valueForKey:kKSUserIDKey];
//        if (id == self.user.ID) {
//            self.user.gender = [dictionary valueForKey:kKSUserGenderKey];
//            NSLog(@"");
//        }
//    }
//}

- (void)parsingFromResult:(id)result {

            NSString *gender = [result  valueForKey:@"gender"];
                self.user.gender = gender;
                NSLog(@"");

        }

@end
