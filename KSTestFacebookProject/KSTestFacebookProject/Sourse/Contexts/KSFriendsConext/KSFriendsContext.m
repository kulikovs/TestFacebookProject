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

- (void)parsingFromResult:(NSDictionary *)result {
    NSArray *array = [result valueForKeyPath:kKSFriendsKey];
    NSMutableArray *friendsArray = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        NSString *id = [dictionary  valueForKey:kKSUserIDKey];
        KSUser *user = [[KSUser alloc] initWithID:id];
        
        user.firstName = [dictionary valueForKey:kKSFirstNameKey];
        user.lastName = [dictionary valueForKey:kKSLastNameKey];
        user.URLStringSmallImage = [dictionary valueForKeyPath:kKSPictureURLKey];
        
        [friendsArray addObject:user];
    }
    
    [self.user replaceFriends:friendsArray];
}

@end