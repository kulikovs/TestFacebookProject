//
//  KSCustomViewController.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 14.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSCustomViewController : UIViewController
@property (nonatomic, readonly) NSString         *navigationBarTitle;
@property (nonatomic, readonly) NSString         *imageNameForLeftButton;
@property (nonatomic, readonly) NSString         *imageNameForRightButton;

- (void)showCustomNavigationBar;

- (void)showNavigationBarWithTitle:(NSString *)title
               leftButtonImageName:(NSString *)leftButtonImageName
              rightButtonImageName:(NSString *)rightButtonImageName;



@end
