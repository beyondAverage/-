//
//  AppDelegate.m
//  LoveLimitedTimeFreeOfApps
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "AppDelegate.h"
#import "TimeLimitViewController.h"
#import "DepreciateViewController.h"
#import "FreeViewController.h"
#import "SubjectViewController.h"
#import "HotListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)createMainUI
{
    //限免
    TimeLimitViewController *timeLimit_vc = [[TimeLimitViewController alloc] init];
    UINavigationController *timeLimit_nav = [[UINavigationController alloc] initWithRootViewController:timeLimit_vc];
    timeLimit_nav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_limitfree@2x"];
    timeLimit_nav.tabBarItem.image = [UIImage imageNamed:@"tabbar_limitfree"];
    timeLimit_nav.tabBarItem.title = @"限免";
    //降价
    DepreciateViewController *dep_vc = [[DepreciateViewController alloc] init];
    UINavigationController *dep_nav = [[UINavigationController alloc] initWithRootViewController:dep_vc];
    dep_nav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_reduceprice@2x"];
    dep_nav.tabBarItem.image = [UIImage imageNamed:@"tabbar_reduceprice"];
    dep_nav.tabBarItem.title = @"降价";
    //免费
    FreeViewController *free_vc = [[FreeViewController alloc] init];
    UINavigationController *free_nav = [[UINavigationController alloc] initWithRootViewController:free_vc];
    free_nav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_appfree_press@2x"];
    free_nav.tabBarItem.image = [UIImage imageNamed:@"tabbar_appfree_press"];
    free_nav.tabBarItem.title = @"免费";
    //专题
    SubjectViewController *subject_vc = [[SubjectViewController alloc] init];
    UINavigationController *subject_nav = [[UINavigationController alloc] initWithRootViewController:subject_vc];
    subject_nav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_subject_press@2x"];
    subject_nav.tabBarItem.image = [UIImage imageNamed:@"tabbar_subject_press"];
    subject_nav.tabBarItem.title = @"专题";
    //热榜
    HotListViewController *hotList_vc = [[HotListViewController alloc] init];
    UINavigationController *hotList_nav = [[UINavigationController alloc] initWithRootViewController:hotList_vc];
    hotList_nav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_rank_press@2x"];
    hotList_nav.tabBarItem.image = [UIImage imageNamed:@"tabbar_rank_press"];
    hotList_nav.tabBarItem.title = @"热榜";
    
    
    //数组存放所有的navigationViewController视图控制器
    NSArray *allNavs = [NSArray arrayWithObjects:timeLimit_nav,dep_nav,free_nav,subject_nav,hotList_nav, nil];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = allNavs;
    tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg@2x"];
    
    
    self.window.rootViewController = tabBarController;
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    [self createMainUI];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
