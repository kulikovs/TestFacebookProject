//
//  KSFriendsContext.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 10.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSFriendsContext.h"
#import "KSUser.h"
#import "KSFacebookConstants.h"

@implementation KSFriendsContext

#pragma mark -
#pragma mark Public methods

- (void)parseResult:(NSDictionary *)result {
    NSArray *array = [result valueForKeyPath:kKSFriendsKey];
    NSMutableArray *friendsArray = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        NSString *ID = [dictionary  valueForKey:kKSUserIDKey];
        KSUser *user = [[KSUser alloc] initWithID:ID];
        
        user.firstName = [dictionary valueForKey:kKSFirstNameKey];
        user.lastName = [dictionary valueForKey:kKSLastNameKey];
        user.URLStringSmallImage = [dictionary valueForKeyPath:kKSPictureURLKey];
        
        [friendsArray addObject:user];
    }
    
    [self.user replaceFriends:friendsArray];
}

@end