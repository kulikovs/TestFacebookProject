//
//  AppDelegate.m
//  KSTestFacebookProject
//
//  Created by KulikovS on 09.06.16.
//  Copyright © 2016 KulikovS. All rights reserved.
//
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "IDPActiveRecordKit.h"

#import "AppDelegate.h"
#import "KSLoginViewController.h"
#import "KSCoreDataConstants.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [IDPCoreDataManager sharedManagerWithMomName:kKSCoreDataModelName];
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    UIWindow *window = [UIWindow new];
    self.window = window;
    
    KSLoginViewController *loginViewController = [KSLoginViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:loginViewController];
    
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

@end
