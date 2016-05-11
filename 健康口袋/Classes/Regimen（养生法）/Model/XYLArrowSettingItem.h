//
//  XYLArrowSettingItem.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLSettingItem.h"

@interface XYLArrowSettingItem : XYLSettingItem
/** 跳转目标控制器 */
@property(nonatomic, strong) Class destinationViewControllerClass;

/** 带有目标控制器参数的自定义方法*/
+ (instancetype) itemWithIcon:(NSString *)icon title:(NSString *)title destinationViewControllerClass:(Class) destinationViewControllerClass;

+ (instancetype) itemWithTitle:(NSString *)title destinationViewControllerClass:(Class) destinationViewControllerClass;

@end
