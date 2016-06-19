//
//  KSUserViewCell.m
//  KSIdapStudy
//
//  Created by KulikovS on 05.05.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSUserViewCell.h"
#import "KSImageView.h"
#import "KSUserModel.h"

@implementation KSUserViewCell

#pragma mark -
#pragma mark Public Methods

- (void)fillWithUser:(KSUserModel *)user {
    self.customImageView.URL = [NSURL URLWithString:user.urlSmallImage];
    self.stringsLabel.text = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
}

@end
