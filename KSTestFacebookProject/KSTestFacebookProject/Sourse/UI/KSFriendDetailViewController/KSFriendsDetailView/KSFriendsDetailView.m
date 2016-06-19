//
//  KSFriendsDetailView.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 12.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSFriendsDetailView.h"
#import "KSUserModel.h"
#import "KSFacebookConstants.h"
#import "KSImageView.h"

@implementation KSFriendsDetailView

- (void)fillWithUser:(KSUserModel *)user {
    self.firstName.text = user.firstName;
    self.lastName.text = user.lastName;
    self.gender.text = user.gender;
    self.largePhoto.URL = [NSURL URLWithString:[NSString stringWithFormat:kKSLargePictureURL, user.ID]];
}

@end
