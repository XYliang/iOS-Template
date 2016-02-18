//
//  AppDelegate.m
//  健康口袋
//
//  Created by 薛银亮 on 16/1/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "AppDelegate.h"
#import "XYLTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[XYLTabBarController alloc]init];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
