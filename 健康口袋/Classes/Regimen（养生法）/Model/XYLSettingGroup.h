//
//  XYLSettingGroup.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYLSettingGroup : NSObject
/** 每个group的cell数据 */
@property(nonatomic, strong) NSArray *items;

/** 头部标题 */
@property(nonatomic, copy) NSString *headerTitle;

/** 尾部标题 */
@property(nonatomic, copy) NSString *tailTitle;
@end
