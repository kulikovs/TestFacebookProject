//
//  UICollectionView+UICollectionView.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 23.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "UICollectionView+UICollectionView.h"

@implementation UICollectionView (UICollectionView)

- (id)dequeueReusableCellFromNibWithClass:(Class)theClass {
    id cell = [self dequeueReusableCellFromNibWithClass:theClass];
    if (!cell) {
        cell = [UINib loadFromNibWithClass:(theClass)];
    }
    
    return cell;
}

@end
