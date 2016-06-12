//
//  KSUserContext.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 10.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSModel.h"

@class KSUser;

@interface KSUserContext : NSObject
@property (nonatomic, retain) KSUser *user;

- (instancetype)initWithUser:(KSUser *)user;
- (void)performWork;

@end
