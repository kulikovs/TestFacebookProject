//
//  KSFacebookContext.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 13.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KSUser;

@interface KSFacebookContext : NSObject
@property (nonatomic, strong)   KSUser *user;
@property (nonatomic, readonly) NSDictionary *requestParameters;

- (instancetype)initWithUser:(KSUser *)user;
- (void)parseResult:(NSDictionary *)result;
- (void)execute;
- (void)cancel;

@end
