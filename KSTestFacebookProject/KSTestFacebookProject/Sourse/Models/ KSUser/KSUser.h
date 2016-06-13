//
//  KSUser.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 09.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSModel.h"

@class KSImageView;

@interface KSUser : KSModel
@property (nonatomic, copy)     NSString        *ID;
@property (nonatomic, copy)     NSString        *firstName;
@property (nonatomic, copy)     NSString        *lastName;
@property (nonatomic, copy)     NSString        *gender;
@property (nonatomic, copy)     NSString        *URLStringSmallImage;
@property (nonatomic, copy)     NSString        *URLStringLargeImage;

@property (nonatomic, readonly) NSArray         *friends;
@property (nonatomic, assign)   BOOL            isLogedIn;

- (instancetype)initWithID:(NSString *)ID;

- (void)addFriend:(KSUser *)friend;
- (void)addFriends:(NSArray *)friends;
- (void)replaceFriends:(NSArray *)friends;
- (void)removeObject:(KSUser *)user;
- (void)removeAllObject;

@end
