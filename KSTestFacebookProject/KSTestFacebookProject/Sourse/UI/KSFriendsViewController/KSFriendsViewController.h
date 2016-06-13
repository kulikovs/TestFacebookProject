//
//  KSFriendsViewController.h
//  KSIdapStudy
//
//  Created by KulikovS on 08.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSUser;
@class KSFriendsContext;

@interface KSFriendsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) KSFriendsContext *friendsContext;
@property (nonatomic, strong) KSUser            *user;

@end
