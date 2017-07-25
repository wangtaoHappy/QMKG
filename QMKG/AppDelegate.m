//
//  AppDelegate.m
//  QMKG
//
//  Created by 王涛 on 2017/7/17.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FindViewController.h"
#import "MessageViewController.h"
#import "MyInfoViewController.h"
#import "KViewController.h"
#import "QMNavigationViewController.h"
#import "BaseNavigationController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    //设置点击item颜色
    tabbarController.tabBar.tintColor = [UIColor redColor];
    //设置tabBar颜色，使得不透视颜色
    tabbarController.tabBar.barTintColor = [UIColor whiteColor];
    [tabbarController.tabBar addSubview:({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(QM_WIDTH/2 - 20, 5, 40, 40);
        button.backgroundColor = RANDOM_COLOR;
        [button addTarget:self action:@selector(KbuttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    self.window.rootViewController = tabbarController;
    
    ViewController *VC1 = [[ViewController alloc] init];
    VC1.title = @"首页";
    VC1.view.backgroundColor = [UIColor whiteColor];
    QMNavigationViewController *Nav1 = [[QMNavigationViewController alloc] initWithRootViewController:VC1];
    
    FindViewController *VC2 = [[FindViewController alloc] init];
    VC2.title = @"发现";
    BaseNavigationController *Nav2 = [[BaseNavigationController alloc] initWithRootViewController:VC2];

    
    KViewController *VC3 = [[KViewController alloc] init];

    BaseNavigationController *Nav3 = [[BaseNavigationController alloc] initWithRootViewController:VC3];
    
    MessageViewController *VC4 = [[MessageViewController alloc] init];
    VC4.title = @"消息";
    BaseNavigationController *Nav4 = [[BaseNavigationController alloc] initWithRootViewController:VC4];
    
    MyInfoViewController *VC5 = [[MyInfoViewController alloc] init];
    VC5.title = @"我的";
    BaseNavigationController *Nav5 = [[BaseNavigationController alloc] initWithRootViewController:VC5];
    
    tabbarController.viewControllers = @[Nav1,Nav2,Nav3,Nav4,Nav5];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)KbuttonClicked:(UIButton *)sender {

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
