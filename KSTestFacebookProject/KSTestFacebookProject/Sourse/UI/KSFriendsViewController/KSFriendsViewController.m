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

static NSString * const kKSFriendsBarTitle       = @"FRIENDS";
static NSString * const kKSLeftBurBattonImageName = @"BackButton1";

@interface KSFriendsViewController ()
@property (nonatomic, readonly) KSFriendsView *rootView;
@property (nonatomic, readonly) NSArray       *userFriends;

@end

@implementation KSFriendsViewController

@dynamic rootView;
@dynamic userFriends;

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
        [_friendsContext execute];
    }
}

- (NSArray *)userFriends {
   return self.user.friends;
}

- (NSString *)navigationBarTitle {
    return kKSFriendsBarTitle;
}

- (NSString *)imageNameForLeftButton {
    return kKSLeftBurBattonImageName;
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showCustomNavigationBar];
    
    if (self.user.state != kKSModelStateLoaded) {
        [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    }
}

#pragma mark -
#pragma mark UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userFriends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSUserViewCell *cell = [tableView dequeueReusableCellFromNibWithClass:[KSUserViewCell class]];
    [cell fillWithUser:self.userFriends[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    KSFriendDetailViewController * controller = [KSFriendDetailViewController new];
    controller.user = self.userFriends[indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
}

@end
