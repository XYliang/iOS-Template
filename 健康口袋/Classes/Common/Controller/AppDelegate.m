//
//  AppDelegate.m
//  健康口袋
//
//  Created by 薛银亮 on 16/1/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "AppDelegate.h"
#import "XYLTabBarController.h"
#import "XYLLoginController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建应用Key_Bmob
    [Bmob registerWithAppKey:@"d58b1bf0a15f74744ef7cd6a46d2caba"];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    BmobUser *bUser = [BmobUser getCurrentUser];
    if (bUser) {
        //进行操作
        self.window.rootViewController = [[XYLTabBarController alloc]init];
    }else{
        //对象为空时，可打开用户注册界面
        self.window.rootViewController = [[XYLLoginController alloc]init];
    }
    [self.window makeKeyAndVisible];
    return YES;
}

@end
