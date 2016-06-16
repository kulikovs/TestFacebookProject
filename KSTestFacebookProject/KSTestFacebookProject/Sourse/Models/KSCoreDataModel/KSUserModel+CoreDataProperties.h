//
//  KSUserModel+CoreDataProperties.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 16.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KSUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSUserModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSNumber *isLogedIn;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *urlLargeImage;
@property (nullable, nonatomic, retain) NSString *urlSmallImage;
@property (nullable, nonatomic, retain) NSSet<KSUserModel *> *friends;

@end

@interface KSUserModel (CoreDataGeneratedAccessors)

- (void)addFriendsObject:(KSUserModel *)value;
- (void)removeFriendsObject:(KSUserModel *)value;
- (void)addFriends:(NSSet<KSUserModel *> *)values;
- (void)removeFriends:(NSSet<KSUserModel *> *)values;

@end

NS_ASSUME_NONNULL_END
