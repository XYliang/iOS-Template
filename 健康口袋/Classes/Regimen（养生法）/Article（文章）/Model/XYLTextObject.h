//
//  XYLTextObject.h
//  健康口袋
//
//  Created by 薛银亮 on 16/3/3.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYLTextObject : NSObject
@property(copy, nonatomic)NSString *title;
@property(copy, nonatomic)NSString *imageStr;
@property(copy, nonatomic)NSString *textStr;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)textObjectWithDictionary:(NSDictionary *)dict;
@end
