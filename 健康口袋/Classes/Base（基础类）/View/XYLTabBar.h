//
//  XYLTabBar.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYLTabBar;

//设置代理
@protocol XYLTabBarDelegate <NSObject>
@optional
-(void)tabBar:(XYLTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
@end

@interface XYLTabBar : UIView
@property (nonatomic,weak) id<XYLTabBarDelegate>delegate;
//添加一个item的方法
-(void)addTabBarButtonWithItem:(UITabBarItem *)item;
@end
