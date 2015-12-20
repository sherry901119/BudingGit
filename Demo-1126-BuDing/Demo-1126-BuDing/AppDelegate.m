//
//  AppDelegate.m
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/26.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondeViewController.h"
#import "ThirdViewController.h"
#import "LeftViewController.h"

#import "MMDrawerController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];;
    self.window.backgroundColor = [UIColor whiteColor];
    
    FirstViewController *firstVC = [FirstViewController new];
    SecondeViewController *secondeVC = [SecondeViewController new];
    ThirdViewController *thirdVC = [ThirdViewController new];
    
    LeftViewController *leftVC = [LeftViewController new];
    
    UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:firstVC];
    //[[UINavigationBar appearance]setBarTintColor:[UIColor yellowColor]];
    
    UINavigationController *secondeNav = [[UINavigationController alloc]initWithRootViewController:secondeVC];
    
    UINavigationController *thirdNav = [[UINavigationController alloc]initWithRootViewController:thirdVC];

    UITabBarController *tabBarcontroller = [UITabBarController new];
    tabBarcontroller.viewControllers = @[firstNav,secondeNav,thirdNav];
    
    UITabBarItem *item1 = tabBarcontroller.tabBar.items[0];
    UITabBarItem *item2 = tabBarcontroller.tabBar.items[1];
    UITabBarItem *item3 = tabBarcontroller.tabBar.items[2];
    
    
    item1.title = @"番组";
    item2.title = @"时间线";
    item3.title = @"异次元";
    
    //设置左边框和中间框
    MMDrawerController *drawerController = [[MMDrawerController alloc]initWithCenterViewController:tabBarcontroller leftDrawerViewController:leftVC];
    
    //drawer的打开方式，和关闭方式，任何手势都可以
    drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
    self.window.rootViewController = drawerController;
    [self.window makeKeyAndVisible];
    
    
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
