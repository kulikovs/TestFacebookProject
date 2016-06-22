//
//  KSFacebookConstants.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 11.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#ifndef KSFacebookConstants_h
#define KSFacebookConstants_h

static NSString * const kKSFriendsKey       = @"friends.data";
static NSString * const kKSFriendsPhotosKey = @"friends.data.albums.data";
static NSString * const kKSUserIDKey        = @"id";
static NSString * const kKSFirstNameKey     = @"first_name";
static NSString * const kKSLastNameKey      = @"last_name";
static NSString * const kKSUserGenderKey    = @"gender";
static NSString * const kKSPictureURLKey    = @"picture.data.url";
static NSString * const kKSHTTPMethod       = @"GET";
static NSString * const kKSLargePictureURL  = @"https://graph.facebook.com/%@/picture?type=large";

#define kKSFriendsRequestParameters         @{@"fields": @"friends{first_name,last_name,gender,picture,albums{photos{link}}}"}
#define kKSUserRequestParameters            @{@"fields": @"id,first_name,last_name,gender,friends,photos"}
#define kKSUserPhotosRequestParameters      @{@"fields": @"albums{photos{link}}"}

#define kKSLogInPermissions         @[@"public_profile", @"email", @"user_friends", @"user_photos"]


#endif /* KSFacebookConstants_h */
