//
//  KSFacebookContext.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 13.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "KSUser.h"
#import "KSFacebookConstants.h"
#import "KSFacebookContext.h"

@interface KSFacebookContext ()
@property (nonatomic, strong) FBSDKGraphRequestConnection *requestConnections;

@end

@implementation KSFacebookContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithUser:(KSUser *)user {
    self = [self init];
    if (self) {
        self.user = user;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setRequestConnections:(FBSDKGraphRequestConnection *)requestConnections {
    if (_requestConnections != requestConnections) {
        [_requestConnections cancel];
        
        _requestConnections = requestConnections;
        [_requestConnections start];
    }
}

- (NSDictionary *)requestParameters {
    return kKSFriendsRequestParameters;
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
   FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.user.ID
                                      parameters:self.requestParameters
                                      HTTPMethod:kKSHTTPMethod];
    
    self.requestConnections = [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error)
     {
         [self parsingFromResult:result];
         [self.user setState:kKSModelStateLoaded withObject:nil];
     }];
}

- (void)parsingFromResult:(NSDictionary *)result {

}

- (void)cancel {
    [self.requestConnections cancel];
}

@end
