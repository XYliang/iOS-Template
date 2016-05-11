//
//  XYLGoods.h
//  健康口袋
//
//  Created by 薛银亮 on 16/3/4.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYLGoods : NSObject
@property(copy, nonatomic)NSString *goodsImageStr;
@property(copy, nonatomic)NSString *goodsNameStr;
@property(copy, nonatomic)NSString *goodsPriceStr;
@property(copy, nonatomic)NSString *goodsMountsStr;
@property(copy, nonatomic)NSString *goodsEfficacyStr;//功效
@property(copy, nonatomic)NSString *goodsAllopathyStr;//对症
@property(copy, nonatomic)NSString *goodsCrowdsStr;//人群
@property(copy, nonatomic)NSString *goodsNotesStr;//注意
+(instancetype)goodsWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
