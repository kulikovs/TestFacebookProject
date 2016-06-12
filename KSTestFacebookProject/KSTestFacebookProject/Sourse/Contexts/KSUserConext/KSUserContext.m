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

static NSString * const kKSFriendsKey       = @"friends.data";
static NSString * const kKSUserIDKey        = @"id";
static NSString * const kKSFirstNameKey     = @"first_name";
static NSString * const kKSLastNameKey      = @"last_name";
static NSString * const kKSPictureURLKey    = @"picture.data.url";

#define kKSRequestParameters @{@"fields": @"friends{first_name,last_name,gender,picture}"}

@interface KSUserContext ()
@property (nonatomic, retain) KSUser *user;

- (void)parsingFromResultArray:(NSArray *)resultArray;

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
                                                                   HTTPMethod:@"GET"];
    
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error)
     {
         [self parsingFromResultArray:[result valueForKeyPath:kKSFriendsKey]];
         [self.user setState:kKSUserStateLoaded withObject:nil];
     }];
}

#pragma mark -
#pragma mark Private methods

- (void)parsingFromResultArray:(NSArray *)resultArray {
    NSMutableArray *friendsArray = [NSMutableArray array];
    
    for (NSDictionary *dictionary in resultArray) {
        NSString *id = [dictionary  valueForKey:kKSUserIDKey];
        KSUser *user = [[KSUser alloc] initWithID:id isLogedIn:NO];
        
        user.firstName = [dictionary valueForKey:kKSFirstNameKey];
        user.lastName = [dictionary valueForKey:kKSLastNameKey];
        user.URLStringSmallImage = [dictionary valueForKeyPath:kKSPictureURLKey];
        
        [friendsArray addObject:user];
    }
    
    [self.user addFriends:friendsArray];
}

@end