//
//  XYLNetWorking.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/27.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  定义请求成功的block
 */
typedef void(^successBlock)(id responseBody);
/**
 *  定义请求失败的block
 */
typedef void(^failureBlock)(NSError *error);

@interface XYLNetWorking : NSObject

@end
