//
//  CollectionViewCell.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 22.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSImageView.h"

@interface KSUserCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet KSImageView    *customImageView;

@end
