//
//  XYLSettingItem.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLSettingItem.h"

@implementation XYLSettingItem
/** 自定义初始化方法 */
+ (instancetype) itemWithIcon:(NSString *) icon title:(NSString *) title {
    // 注意要使用 self 来进行 alloc、init才能适配子类进行正确的初始化
    XYLSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype) itemWithTitle:(NSString *) title {
    return [self itemWithIcon:nil title:title];
}

@end
