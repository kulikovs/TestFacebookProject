//
//  KSFriendsViewController.h
//  KSIdapStudy
//
//  Created by KulikovS on 08.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSUser;
@class KSUserContext;

@interface KSFriendsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) KSUser        *user;

@end
