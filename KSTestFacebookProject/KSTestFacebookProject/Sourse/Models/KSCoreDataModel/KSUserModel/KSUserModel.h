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

@end

NS_ASSUME_NONNULL_END

#import "KSUserModel+CoreDataProperties.h"
