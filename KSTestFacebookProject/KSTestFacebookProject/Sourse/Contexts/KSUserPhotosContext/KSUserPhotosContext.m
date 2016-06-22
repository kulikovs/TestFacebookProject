//
//  KSFriendsPhotosContext.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 22.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSUserPhotosContext.h"
#import "KSFacebookConstants.h"

#import "KSUserPhoto.h"
#import "KSUserModel.h"

@implementation KSUserPhotosContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kKSUserPhotosRequestParameters;
}

#pragma mark -
#pragma mark Public methods

//- (void)parseResult:(NSDictionary *)result {
//    NSArray *array = [result valueForKeyPath:kKSFriendsKey];
//    NSMutableArray *friends = [NSMutableArray array];
//    
//    for (NSDictionary *dictionary in array) {
//        NSString *ID = [dictionary  valueForKey:kKSUserIDKey];
//        
//        KSUserPhoto *photo = [KSUserPhoto  objectWithID:ID];

//    }
    
//    [self.user addFriends:[NSSet setWithArray:[friends copy]]];
//}

@end

