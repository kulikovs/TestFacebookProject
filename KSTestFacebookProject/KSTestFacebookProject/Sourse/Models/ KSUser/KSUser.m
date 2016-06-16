//
//  KSUser.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 09.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSUser.h"
#import "KSImageView.h"

@interface KSUser ()
@property (nonatomic, strong)   NSMutableArray  *friendsArray;

@end

@implementation KSUser

@dynamic friends;

#pragma mark - 
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isLogedIn = NO;
        self.friendsArray = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)initWithID:(NSString *)ID {
    self = [self init];
    if (self) {
        self.ID = ID;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)friends {
    return [self.friendsArray copy];
}

#pragma mark -
#pragma mark Public Methods

- (void)addFriend:(KSUser *)friend {
    [self.friendsArray addObject:friend];

}
- (void)addFriends:(NSArray *)friends {
    [self.friendsArray addObjectsFromArray:friends];
}

- (void)replaceFriends:(NSArray *)friends {
    [self.friendsArray setArray:friends];
}

- (void)removeObject:(KSUser *)user {
    [self.friendsArray removeObject:user];
}

- (void)removeAllObject {
    [self.friendsArray removeAllObjects];
}


@end
