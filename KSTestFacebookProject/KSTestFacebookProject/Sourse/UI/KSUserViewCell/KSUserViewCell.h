//
//  KSUserViewCell.h
//  KSIdapStudy
//
//  Created by KulikovS on 05.05.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSImageView;
@class KSUserModel;

@interface KSUserViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel                 *stringsLabel;
@property (nonatomic, strong) IBOutlet KSImageView             *customImageView;

- (void)fillWithUser:(KSUserModel *)user;

@end
