//
//  XYLButtonDataObject.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/25.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYLButtonDataObject : NSObject
@property(copy, nonatomic)NSString *iconString;
@property(copy, nonatomic)NSString  *titleString;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)objectWithDict:(NSDictionary *)dict;
@end
