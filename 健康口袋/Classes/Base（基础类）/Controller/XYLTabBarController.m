//
//  YXLTabBarController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLTabBarController.h"
#import "XYLNavigationController.h"
#import "XYLHomeController.h"
#import "XYLGuidanceController.h"
#import "XYLMyController.h"
#import "XYLTabBar.h"

@interface XYLTabBarController ()<XYLTabBarDelegate>
@property(weak, nonatomic)XYLTabBar *xylTabBar;
@end

@implementation XYLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加自定义的tabbar
    [self setupTabbar];
    //添加所有子控制器
    [self setupAllChildViewController];
}

#pragma mark添加自定义的tabbar
-(void)setupTabbar
{
    XYLTabBar *customTabBar = [[XYLTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.xylTabBar = customTabBar;
}

#pragma mark监听按钮的改变
-(void)tabBar:(XYLTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

#pragma mark添加所有子控制器
-(void)setupAllChildViewController
{
    XYLHomeController *homeController = [[XYLHomeController alloc]init];
    XYLGuidanceController *guidanceController = [[XYLGuidanceController alloc]init];
    XYLMyController *myController = [[XYLMyController alloc]init];
    [self setupChildViewController:homeController title:@"首页" imageName:@"Home_F" selectedImageName:@"Home_L"];
    [self setupChildViewController:guidanceController title:@"便民" imageName:@"convenient2_F" selectedImageName:@"convenient2_L"];
    [self setupChildViewController:myController title:@"我的" imageName:@"user_L" selectedImageName:@"user_F"];
}

/**初始化一个子控件 */
-(void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //设置控制器的属性
    
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //不进行图片渲染
    
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //包装导航控制器
    
    XYLNavigationController *Nav = [[XYLNavigationController alloc]initWithRootViewController:childVc];
    
    [self addChildViewController:Nav];
    
    //添加tabBar内部的按钮
    [self.xylTabBar addTabBarButtonWithItem:childVc.tabBarItem];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //删除系统原来里面的tabbaritem
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

@end
