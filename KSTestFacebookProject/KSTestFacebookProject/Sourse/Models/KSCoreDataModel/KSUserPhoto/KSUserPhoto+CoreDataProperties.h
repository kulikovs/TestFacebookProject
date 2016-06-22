//
//  KSUserPhoto+CoreDataProperties.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 22.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KSUserPhoto.h"
#import "KSUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSUserPhoto (CoreDataProperties)

@property (nonatomic, strong) NSString      *url;
@property (nonatomic, strong) NSDate        *dateModifications;
@property (nonatomic, strong) KSUserModel   *user;

@end

NS_ASSUME_NONNULL_END
