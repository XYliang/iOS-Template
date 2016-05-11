//
//  UIImage+Extension.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+(UIImage *)imageWithName:(NSString *)name;
//返回自由拉伸的图片
+(UIImage *)resizedImageWithName:(NSString *)name;

+(UIImage *)resizableImage:(NSString *)name;

+ (UIImage *)imageWithColor:(UIColor *)color;
//创建圆形图片
+ (id)createRoundedRectImage:(UIImage*)image;
@end
