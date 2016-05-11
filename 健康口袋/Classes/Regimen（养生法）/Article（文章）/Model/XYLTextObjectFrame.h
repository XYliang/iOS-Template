//
//  XYLTextObjectFrame.h
//  健康口袋
//
//  Created by 薛银亮 on 16/3/3.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYLTextObject.h"

@interface XYLTextObjectFrame : NSObject

@property(assign,nonatomic) CGRect cellTitleF;
@property(assign,nonatomic) CGRect cellImageViewF;
@property(assign,nonatomic) CGRect cellTextViewF;
@property(assign,nonatomic) CGFloat cellHeight;
@property(strong, nonatomic)XYLTextObject *textObject;

@end
