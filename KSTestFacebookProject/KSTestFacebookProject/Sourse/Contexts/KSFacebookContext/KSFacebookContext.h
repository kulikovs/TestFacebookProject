//
//  KSFacebookContext.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 13.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSModel.h"

@class KSUser;

@interface KSFacebookContext : KSModel
@property (nonatomic, strong)   KSUser *user;
@property (nonatomic, readonly) NSDictionary *requestParameters;

- (instancetype)initWithUser:(KSUser *)user;
- (void)execute;
- (void)cancel;

//these methods are called in subclasses
//you should never call these method directly from outside subclasses
- (void)parseResult:(NSDictionary *)result;

@end
