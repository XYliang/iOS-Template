//
//  XYLSettingController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLSettingController.h"
#import "XYLSettingItem.h"
#import "XYLSettingGroup.h"
#import "XYLArrowSettingItem.h"
#import "XYLSwitchSettingItem.h"
#import "XYLLabelSettingItem.h"

@interface XYLSettingController ()

@end

@implementation XYLSettingController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 设置标题
    self.title = @"设置";
    
    // 配置数据
    [self setupGroup0];
    [self setupGroup1];
}

- (void) setupGroup0
{
    XYLSettingItem *activeItem = [XYLSwitchSettingItem itemWithIcon:nil title:@"运动"];
    XYLSettingItem *zhogyiItem = [XYLSwitchSettingItem itemWithIcon:nil title:@"中医"];
    XYLSettingItem *poolItem = [XYLSwitchSettingItem itemWithIcon:nil title:@"煲汤"];
    XYLSettingItem *zhenjiuItem = [XYLSwitchSettingItem itemWithIcon:nil title:@"针灸"];
    XYLSettingItem *shiliaoItem = [XYLSwitchSettingItem itemWithIcon:nil title:@"食疗"];
    
    XYLSettingGroup *group = [[XYLSettingGroup alloc] init];
    group.items = @[activeItem, zhogyiItem, poolItem, zhenjiuItem, shiliaoItem];
    
    [self.data addObject:group];
}

- (void) setupGroup1
{
    XYLSettingItem *manItem = [XYLSwitchSettingItem itemWithIcon:nil title:@"男性"];
    XYLSettingItem *womanItem = [XYLSwitchSettingItem itemWithIcon:nil title:@"女性"];
    XYLSettingItem *childrenItem = [XYLSwitchSettingItem itemWithIcon:nil title:@"小孩"];
    XYLSettingItem *oldmanItem = [XYLSwitchSettingItem itemWithIcon:nil title:@"老人"];
    
    XYLSettingGroup *group = [[XYLSettingGroup alloc] init];
    group.items = @[manItem, womanItem, childrenItem, oldmanItem];
    [self.data addObject:group];
}

@end
