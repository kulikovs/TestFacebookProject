//
//  KSFriendsDetailView.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 12.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSView.h"

@class KSImageView;
@class KSUserModel;

@interface KSFriendsDetailView : KSView
@property (nonatomic, strong) IBOutlet UILabel      *firstName;
@property (nonatomic, strong) IBOutlet UILabel      *lastName;
@property (nonatomic, strong) IBOutlet UILabel      *gender;
@property (nonatomic, strong) IBOutlet KSImageView  *largePhoto;
@property (nonatomic, strong) IBOutlet UIButton     *allUserPhotos;

- (void)fillWithUser:(KSUserModel *)user;

@end
