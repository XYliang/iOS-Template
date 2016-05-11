//
//  XYLSettingItem.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RunningBlock)();

/** item基类 */
@interface XYLSettingItem : NSObject

/** 图标 */
@property(nonatomic, copy) NSString *icon;

/** 标题 */
@property(nonatomic, copy) NSString *title;

/** block代码 */
@property(nonatomic, copy) RunningBlock runningBlock;

/** 副标题 */
@property(nonatomic, copy) NSString *subTitle;

+ (instancetype) itemWithIcon:(NSString *) icon title:(NSString *) title;
+ (instancetype) itemWithTitle:(NSString *) title;


@end
