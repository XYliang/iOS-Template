//
//  XYLTextObjectFrame.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/3.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLTextObjectFrame.h"

@implementation XYLTextObjectFrame

-(void)setTextObject:(XYLTextObject *)textObject
{
    _textObject = textObject;
    CGFloat titleW = ScreenWeight - 2*MaxMargin;
    CGFloat titleH = 30;
    CGFloat titleX = MaxMargin;
    self.cellTitleF = CGRectMake(titleX, 0, titleW, titleH);
    self.cellImageViewF = CGRectMake(0, titleH, ScreenWeight, 200);
    
    NSString *string = [textObject.textStr stringByAppendingString:@"&#12288&#12288"];
    CGSize textSize = [string sizeWithFont:[UIFont systemFontOfSize:19] maxSize:CGSizeMake(ScreenWeight - 2*MaxMargin, MAXFLOAT)];
    self.cellTextViewF = CGRectMake(MaxMargin, CGRectGetMaxY(self.cellImageViewF), ScreenWeight - 2*MaxMargin, textSize.height +2*MaxMargin);
    self.cellHeight = CGRectGetMaxY(self.cellTextViewF);
}


@end
