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
#import "KSUserContext.h"
#import "KSUserViewCell.h"
#import "KSStateModel.h"

@interface KSFriendsViewController ()
@property (nonatomic, readonly) KSFriendsView *rootView;

-(void)load;

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
                    state:kKSUserStateLoaded
                   object:self];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)load {
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    KSUserContext *context = [[KSUserContext alloc] initWithUser:self.user];
    [context performWork];
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self load];
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
