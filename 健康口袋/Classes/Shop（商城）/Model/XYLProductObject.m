//
//  XYLProductObject.m
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLProductObject.h"

@implementation XYLProductObject

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)productWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
