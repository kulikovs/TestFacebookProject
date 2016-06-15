//
//  KSCustomViewController.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 14.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSCustomViewController.h"

@interface KSCustomViewController ()
@property (nonatomic, readonly) UINavigationItem *navigationItem;

- (void)clickLeftBarButton;
- (void)clickRightBarButton;

@end

@implementation KSCustomViewController

@dynamic navigationItem;
@dynamic navigationBarTitle;
@dynamic imageNameForRightButton;
@dynamic imageNameForLeftButton;

#pragma mark -
#pragma mark Accessors

- (UINavigationItem *)navigationItem {
    return self.navigationController.navigationBar.topItem;
}

- (NSString *)navigationBarTitle {
    return nil;
}

- (NSString *)imageNameForLeftButton {
    return nil;
}

- (NSString *)imageNameForRightButton {
    return nil;
}

#pragma mark - 
#pragma mark Public Methods

- (void)showCustomNavigationBar {
    [self showNavigationBarWithTitle:self.navigationBarTitle
                 leftButtonImageName:self.imageNameForLeftButton
                rightButtonImageName:self.imageNameForRightButton];
}

- (void)showNavigationBarWithTitle:(NSString *)title
               leftButtonImageName:(NSString *)leftButtonImageName
              rightButtonImageName:(NSString *)rightButtonImageName
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = title;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem
                                             buttonWithImageName:leftButtonImageName
                                                        selector:@selector(clickLeftBarButton)
                                                          target:self];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem
                                              buttonWithImageName:rightButtonImageName
                                                         selector:@selector(clickRightBarButton)
                                                           target:self];
}

#pragma mark -
#pragma mark Private Methods

- (void)clickLeftBarButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickRightBarButton {

}

@end
