//
//  KSFriendsViewController.m
//  KSIdapStudy
//
//  Created by KulikovS on 08.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//

#import "KSFriendsViewController.h"
#import "KSFriendDetailViewController.h"
#import "KSFriendsView.h"
#import "KSUser.h"
#import "KSFriendsContext.h"
#import "KSUserViewCell.h"
#import "KSStateModel.h"

@interface KSFriendsViewController ()
@property (nonatomic, readonly) KSFriendsView *rootView;

@end

@implementation KSFriendsViewController

#pragma mark -
#pragma mark Accessors

KSRootViewAndReturnNilMacro(KSFriendsView);

- (void)setUser:(KSUser *)user {
    if (_user != user) {
        _user = user;
        
        KSWeakifySelf;
        [_user addHandler:^(KSStateModel *object) {
            KSStrongifySelfWithClass(KSFriendsViewController);
            KSFriendsView *rootView = strongSelf.rootView;
            [rootView.tableView reloadData];
            [rootView removeLoadingViewAnimated:YES];
        }
                    state:kKSModelStateLoaded
                   object:self];
        
        self.friendsContext = [[KSFriendsContext alloc] initWithUser:self.user];
    }
}

- (void)setFriendsContext:(KSFriendsContext *)friendsContext {
    if (_friendsContext != friendsContext) {
        [_friendsContext cancel];
        _friendsContext = friendsContext;
        if (_friendsContext) {
            [_friendsContext execute];
        }
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.user.state != kKSModelStateLoaded) {
        [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    }
}

#pragma mark -
#pragma mark UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.user.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSUserViewCell *cell = [tableView dequeueReusableCellFromNibWithClass:[KSUserViewCell class]];
    [cell fillWithUser:self.user.friends[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    KSFriendDetailViewController * controller = [KSFriendDetailViewController new];
    controller.user = self.user.friends[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
