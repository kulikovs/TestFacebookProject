//
//  CollectionViewCell.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 22.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSImageView.h"
#import "KSUserPhoto.h"

@interface KSUserCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet KSImageView    *customImageView;

- (void)fillWithPhoto:(KSUserPhoto *)userPhoto;

@end
