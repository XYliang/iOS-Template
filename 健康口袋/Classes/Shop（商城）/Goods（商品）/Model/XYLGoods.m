//
//  XYLGoods.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/4.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLGoods.h"

@implementation XYLGoods

+(instancetype)goodsWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
