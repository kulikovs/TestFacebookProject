//
//  KSCustomViewController.h
//  KSTestFacebookProject
//
//  Created by KulikovS on 14.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

@class KSFacebookContext;
@class KSUser;

#import <UIKit/UIKit.h>

@interface KSCustomViewController : UIViewController
@property (nonatomic, readonly) NSString            *navigationBarTitle;
@property (nonatomic, readonly) NSString            *imageNameForLeftButton;
@property (nonatomic, readonly) NSString            *imageNameForRightButton;
@property (nonatomic, strong)   KSFacebookContext   *context;
@property (nonatomic, strong)   KSUser              *user;

- (void)showCustomNavigationBar;

- (void)showNavigationBarWithTitle:(NSString *)title
               leftButtonImageName:(NSString *)leftButtonImageName
              rightButtonImageName:(NSString *)rightButtonImageName;

//these methods are called in subclasses
//you should never call these method directly from outside subclasses
- (void)addHandlers;
- (void)contextDidLoad;
- (void)contextLoadFailed;


@end
