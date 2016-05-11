//
//  XYLButtonDataObject.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/25.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLButtonDataObject.h"

@implementation XYLButtonDataObject
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)objectWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
