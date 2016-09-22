//
//  AppDelegate.m
//  3D-Touch
//
//  Created by lx on 2016/9/21.
//  Copyright © 2016年 sunshine. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DetailViewController.h"
#import "ThirdViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {//判定系统版本
        UIApplicationShortcutItem *shortcutItem = [launchOptions objectForKeyedSubscript:UIApplicationLaunchOptionsShortcutItemKey];
        if(shortcutItem)
        {
            [self quickActionWithShortcutItem:shortcutItem];
        }
    }
    return YES;
}
#pragma mark
#pragma mark - 3D Touch
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    [self quickActionWithShortcutItem:shortcutItem];
    completionHandler(YES);
}



- (void)quickActionWithShortcutItem:(UIApplicationShortcutItem *)shortcutItem
{
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    if ([shortcutItem.type isEqualToString:@"弹一弹"]) {
      
    } else if ([shortcutItem.type isEqualToString:@"摇一摇"]) {
        DetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detail"];
        [nav pushViewController:detailVC animated:YES];
    } else if ([shortcutItem.type isEqualToString:@"扫一扫"]) {
        ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
        [nav pushViewController:thirdVC animated:YES];
    }
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
