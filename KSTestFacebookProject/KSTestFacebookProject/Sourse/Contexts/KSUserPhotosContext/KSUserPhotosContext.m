//
//  KSFriendsPhotosContext.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 22.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSUserPhotosContext.h"
#import "KSFacebookConstants.h"

#import "KSUserPhoto.h"
#import "KSUserModel.h"

@implementation KSUserPhotosContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kKSUserPhotosRequestParameters;
}

#pragma mark -
#pragma mark Public methods

- (void)parseResult:(NSDictionary *)result {
    NSArray *array = [result valueForKeyPath:kKSAlbumsDataKey];
    
    for (NSDictionary *album in array) {
        NSArray *photos = [album valueForKeyPath:kKSPhotoDataKey];
        for (NSDictionary *photoDictionaty in photos) {
            NSString *IDString = [photoDictionaty valueForKey:kKSIDKey];
            KSUserPhoto *userPhoto = [KSUserPhoto objectWithID:IDString];
            NSString *URLString = [photoDictionaty valueForKey:kKSPictureKey];
            userPhoto.url = URLString;
            userPhoto.user = self.user;
        }
    }
}

@end

