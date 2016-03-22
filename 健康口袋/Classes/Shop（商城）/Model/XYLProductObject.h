//
//  XYLProductObject.h
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYLProductObject : NSObject
@property (nonatomic, copy) NSString *money; // 价格
@property (nonatomic, copy) NSString *icon; // 图标
@property (nonatomic, copy) NSString *name; // 名字
@property (nonatomic, copy) NSString *amount; // 销量

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;
@end
