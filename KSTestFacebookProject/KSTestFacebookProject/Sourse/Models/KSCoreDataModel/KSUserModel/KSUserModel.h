//
//  KSUserModel.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 16.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "KSManagedObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSUserModel : KSManagedObject
@property (nonatomic, assign)   BOOL            isLogedIn;
@property (nonatomic, readonly) NSArray         *userFriends;

- (void)addFriend:(KSUserModel *)friend;
- (void)addFriends:(NSArray *)friends;
- (void)removeFriend:(KSUserModel *)friend;
- (void)removeFriends:(NSArray *)friends;

@end

NS_ASSUME_NONNULL_END

#import "KSUserModel+CoreDataProperties.h"
