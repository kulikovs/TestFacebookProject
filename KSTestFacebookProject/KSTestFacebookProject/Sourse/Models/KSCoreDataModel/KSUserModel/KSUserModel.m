//
//  KSUserModel.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 16.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSUserModel.h"
#import "IDPActiveRecordKit.h"
#import "KSCoreDataConstants.h"

@implementation KSUserModel

@dynamic isLogedIn;

#pragma mark -
#pragma mark Accessors

- (void)setIsLogedIn:(BOOL)isLogedIn {
    [self setCustomValue:[NSNumber numberWithBool:isLogedIn] forKey:kKSIsLogedInKey];
}

- (BOOL)isLogedIn {
    NSNumber *value = [self valueForKey:kKSIsLogedInKey];
    return value.boolValue;
}

@end
