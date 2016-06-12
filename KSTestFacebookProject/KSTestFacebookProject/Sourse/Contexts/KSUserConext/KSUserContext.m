//
//  KSUserContext.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 10.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "KSUserContext.h"
#import "KSUser.h"
#import "KSFacebookConstants.h"

@interface KSUserContext ()

//- (void)parsingFromResultArray:(NSArray *)resultArray;
- (void)parsingFromResult:(id)result;
@end

@implementation KSUserContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithUser:(KSUser *)user {
    self = [super init];
    if (self) {
        self.user = user;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)performWork {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.user.ID
                                                                   parameters:kKSRequestParameters
                                                                   HTTPMethod:kKSHTTPMethod];
    
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error)
     {
       //  [self parsingFromResultArray:[result valueForKeyPath:kKSFriendsKey]];
         [self parsingFromResult:result];
         [self.user setState:kKSUserStateLoaded withObject:nil];
     }];
}

//- (void) finishLoading {
//    self.state = kKSModelStateLoading;
//}

#pragma mark -
#pragma mark Private methods

- (void)parsingFromResult:(id)result {
    NSArray *array = [result valueForKeyPath:kKSFriendsKey];
        NSMutableArray *friendsArray = [NSMutableArray array];
    
        for (NSDictionary *dictionary in array) {
            NSString *id = [dictionary  valueForKey:kKSUserIDKey];
            KSUser *user = [[KSUser alloc] initWithID:id isLogedIn:NO];
    
            user.firstName = [dictionary valueForKey:kKSFirstNameKey];
            user.lastName = [dictionary valueForKey:kKSLastNameKey];
            user.URLStringSmallImage = [dictionary valueForKeyPath:kKSPictureURLKey];
    
            [friendsArray addObject:user];
        }
    
        [self.user replaceFriends:friendsArray];
}

//- (void)parsingFromResultArray:(NSArray *)resultArray {
//    NSMutableArray *friendsArray = [NSMutableArray array];
//    
//    for (NSDictionary *dictionary in resultArray) {
//        NSString *id = [dictionary  valueForKey:kKSUserIDKey];
//        KSUser *user = [[KSUser alloc] initWithID:id isLogedIn:NO];
//        
//        user.firstName = [dictionary valueForKey:kKSFirstNameKey];
//        user.lastName = [dictionary valueForKey:kKSLastNameKey];
//        user.URLStringSmallImage = [dictionary valueForKeyPath:kKSPictureURLKey];
//        
//        [friendsArray addObject:user];
//    }
//    
//    [self.user replaceFriends:friendsArray];
//}

@end