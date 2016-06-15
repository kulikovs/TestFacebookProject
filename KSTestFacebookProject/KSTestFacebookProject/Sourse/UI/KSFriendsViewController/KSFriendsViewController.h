//
//  KSFriendsViewController.h
//  KSIdapStudy
//
//  Created by KulikovS on 08.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSCustomViewController.h"

@class KSUser;
@class KSFriendsContext;


@interface KSFriendsViewController : KSCustomViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) KSFriendsContext *friendsContext;
@property (nonatomic, strong) KSUser            *user;

@end
