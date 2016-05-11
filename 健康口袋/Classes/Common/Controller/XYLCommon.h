//
//  XYLCommon.h
//  健康口袋
//
//  Created by 薛银亮 on 16/3/23.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYLCommon : NSObject
HMSingletonH(XYLCommon)
//验证邮箱
- (BOOL)isValidateEmail:(NSString *)email;
//验证手机号
- (BOOL)isValidateMobile:(NSString *)mobileNum;
//验证身份证号
- (BOOL)isValidateIDCardNumber:(NSString *)value;
@end
