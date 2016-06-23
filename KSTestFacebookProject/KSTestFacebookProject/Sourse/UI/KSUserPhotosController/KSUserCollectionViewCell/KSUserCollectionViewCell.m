//
//  CollectionViewCell.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 22.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSUserCollectionViewCell.h"

@implementation KSUserCollectionViewCell

- (void)fillWithPhoto:(KSUserPhoto *)userPhoto {
    self.customImageView.URL = [NSURL URLWithString:userPhoto.url];
}

@end
