//
//  XYLTextObject.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/3.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLTextObject.h"

@implementation XYLTextObject
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return  self;
}

+(instancetype)textObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
