//
//  XYLNavigationController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLNavigationController.h"

@interface XYLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XYLNavigationController

//第一次使用这个类的时候调用一次函数
+(void)initialize
{
    //设置导航栏主题
    [self setupNavBarTheme];
    //设置导航栏按钮的主题
    [self setupBarButtonItemTheme];
}

//设置导航栏主题
+(void)setupNavBarTheme
{
    //取出appearence对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:[UIColor getColor:@"00CC99"]];
    
    //状态栏背景颜色
    [navBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [navBar setBackgroundImage:[UIImage imageWithColor:[UIColor getColor:@"00CC99"]]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[UIImage new]];
    //状态栏保持颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //设置标题的属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //去掉字体阴影
    textAttrs[NSFontAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    [navBar setTitleTextAttributes:textAttrs];

}
//设置导航栏按钮的主题
+(void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =[UIColor blackColor];
    textAttrs[NSFontAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] =[UIColor grayColor];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:Color(251, 32, 37) forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"whiteBackArrow"] forState:UIControlStateNormal];
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.childViewControllers.count > 1) {
        return YES;
    }
    return NO;
}

@end
