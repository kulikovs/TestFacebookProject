//
//  KSUserModel.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 16.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSUserModel.h"
#import "IDPActiveRecordKit.h"

static NSString * const kKSIsLogedInKey = @"isLogedIn";
static NSString * const kKSFriendsKey   = @"friends";

@implementation KSUserModel

@dynamic isLogedIn;
@dynamic userFriends;

#pragma mark -
#pragma mark Accessors

- (void)setIsLogedIn:(BOOL)isLogedIn {
    [self setCustomValue:[NSNumber numberWithBool:isLogedIn] forKey:kKSIsLogedInKey];
}

- (BOOL)isLogedIn {
    NSNumber *value = [self valueForKey:kKSIsLogedInKey];
    return value.boolValue;
}

- (NSArray *)friends {
    NSSet *friends = [self customValueForKey:kKSFriendsKey];
    return friends.allObjects;
}

#pragma mark -
#pragma mark Public Methods

- (void)addFriend:(KSUserModel *)friend {
    [self addCustomValue:friend inMutableSetForKey:kKSFriendsKey];
}

- (void)addFriends:(NSArray *)friends {
    NSSet *friendsSet = [NSSet setWithArray:friends];
    [self addCustomValues:friendsSet inMutableSetForKey:kKSFriendsKey];
}

- (void)removeFriend:(KSUserModel *)friend {
    [self removeCustomValue:friend inMutableSetForKey:kKSFriendsKey];
}

- (void)removeFriends:(NSArray *)friends {
    NSSet *friendsSet = [NSSet setWithArray:friends];
    [self removeCustomValues:friendsSet inMutableSetForKey:kKSFriendsKey];
}

@end
