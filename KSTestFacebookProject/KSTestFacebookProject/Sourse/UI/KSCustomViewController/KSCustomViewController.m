//
//  KSCustomViewController.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 14.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSCustomViewController.h"
#import "KSFacebookContext.h"
#import "KSUser.h"

@interface KSCustomViewController ()
@property (nonatomic, readonly) UINavigationItem  *navigationItem;

- (void)clickLeftBarButton;
- (void)clickRightBarButton;
- (void)addHandlerForUser;
- (void)userDidLoad;
- (void)userLoadFailed;

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

- (void)setContext:(KSFacebookContext *)context {
    if (_context != context) {
        [_context cancel];
        _context = context;
        [_context execute];
    }
}

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        _user = user;
        
        [self addHandlerForUser];
    }
}

#pragma mark -
#pragma mark Life Cycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showCustomNavigationBar];
}

#pragma mark -
#pragma mark Private Methods

- (void)addHandlerForUser {
    KSWeakifySelf;
    [_user addHandler:^(id object) {
        KSStrongifySelfAndReturnIfNil;
        [strongSelf userDidLoad];
    }
                state:kKSModelStateLoaded
               object:self];
    
    [_user addHandler:^(id object) {
        KSStrongifySelfAndReturnIfNil;
        [strongSelf userLoadFailed];
    }
                state:kKSModelStateFailed
               object:self];
}

- (void)clickLeftBarButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickRightBarButton {
    
}

#pragma mark - 
#pragma mark Public Methods

- (void)userDidLoad {

}

- (void)userLoadFailed {

}
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

@end
