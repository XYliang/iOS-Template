//
//  XYLArrowSettingItem.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLArrowSettingItem.h"

@implementation XYLArrowSettingItem
/** 带有目标控制器参数的自定义方法*/
+ (instancetype) itemWithIcon:(NSString *)icon title:(NSString *)title destinationViewControllerClass:(Class) destinationViewControllerClass {
    
    XYLArrowSettingItem *item = [self itemWithIcon:icon title:title];
    item.destinationViewControllerClass = destinationViewControllerClass;
    return item;
}

+ (instancetype) itemWithTitle:(NSString *)title destinationViewControllerClass:(Class) destinationViewControllerClass {
    
    return [self itemWithIcon:nil title:title destinationViewControllerClass:destinationViewControllerClass];
}
@end
