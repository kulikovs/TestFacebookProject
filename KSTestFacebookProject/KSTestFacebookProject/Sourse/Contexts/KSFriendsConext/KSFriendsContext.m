 //
//  KSFriendsContext.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 10.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSFriendsContext.h"
#import "KSUserModel.h"
#import "KSFacebookConstants.h"

@implementation KSFriendsContext

#pragma mark -
#pragma mark Public methods

- (void)parseResult:(NSDictionary *)result {
    NSArray *array = [result valueForKeyPath:kKSFriendsKey];
    NSMutableArray *friends = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        NSString *ID = [dictionary  valueForKey:kKSUserIDKey];
        KSUserModel *user = [KSUserModel  objectWithID:ID];
        user.firstName = [dictionary valueForKey:kKSFirstNameKey];
        user.lastName = [dictionary valueForKey:kKSLastNameKey];
        user.urlSmallImage = [dictionary valueForKeyPath:kKSPictureURLKey];
        
        [friends addObject:user];
    }

    [self.user addFriends:[NSSet setWithArray:[friends copy]]];
}

@end