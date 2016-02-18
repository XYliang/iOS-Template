//
//  XYLTabBar.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLTabBar.h"
#import "XYLTabBarButton.h"

@interface XYLTabBar()
@property (nonatomic,strong) NSMutableArray *tabBarButtons;
@property (nonatomic,weak) XYLTabBarButton *selectedButton;
@end

@implementation XYLTabBar

-(NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    //创建按钮
    XYLTabBarButton *button = [[XYLTabBarButton alloc]init];
    [self addSubview:button];
    
    //添加按钮到数组中
    [self.tabBarButtons addObject:button];
    //设置数据
    button.item = item;
    
    //监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //默认选中第0个按钮
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}

//监听按钮点击
-(void)buttonClick:(XYLTabBarButton *)button
{
    
    //告诉代理按钮被点了
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    // 设置按钮的状态
    
    self.selectedButton.selected = NO;
    
    button.selected = YES;
    self.selectedButton = button;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    //其他按钮的frame数据
    
    CGFloat buttonH = h;
    CGFloat buttonW = w / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index < self.tabBarButtons.count; index++) {
        
        //取出button
        
        XYLTabBarButton *button = self.tabBarButtons[index];
        
        //设置button的frame
        
        CGFloat buttonX = index * buttonW;
        
        button.frame = CGRectMake(buttonX,buttonY,buttonW,buttonH);
        
        //绑定tag
        
        button.tag = index;
    }
}

@end
