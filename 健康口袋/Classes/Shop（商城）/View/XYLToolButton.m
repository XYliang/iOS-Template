//
//  XYLToolButton.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/25.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLToolButton.h"
//按钮图标所占按钮中的高度的比例
#define ButtonImageRatio 0.5

@implementation XYLToolButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = Font(12);
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return  self;
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width * ButtonImageRatio;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = contentRect.size.width * ButtonImageRatio;
    CGFloat titleW = contentRect.size.width * ButtonImageRatio;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, 0, titleW, titleH);
}


@end
