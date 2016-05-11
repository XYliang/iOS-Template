//
//  XYLProductObjectFrame.m
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLProductObjectFrame.h"
#import "XYLProductObject.h"
#define NameFont [UIFont systemFontOfSize:15]
#define MountFont [UIFont systemFontOfSize:13]

@implementation XYLProductObjectFrame

-(void)setProduct:(XYLProductObject *)product
{
    _product = product;
    
    //图片的frame
    CGFloat iconW = [UIScreen mainScreen].bounds.size.width / 2.5f;
    CGFloat iconH = 150;
    self.iconF = CGRectMake(0, 0, iconW, iconH);
    //名字的frame
    CGSize nameSize = [self sizeWithString:_product.name font:NameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameLabelH = nameSize.height;
    CGFloat nameLabelW = nameSize.width;
    CGFloat nameLabelY = CGRectGetMaxY(self.iconF);
    CGFloat nameLabelX = (iconW - nameLabelW) / 2.0f;
    self.nameF = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    //money的frame
    CGFloat moneyLabelX = CGRectGetMaxX(self.iconF) - 10;
    CGSize moneySize = [self sizeWithString:_product.name font:NameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat moneyLabelH = moneySize.height;
    CGFloat moneyLabelW = moneySize.width;
    CGFloat moneyLabelY = nameLabelY;
    self.nameF = CGRectMake(moneyLabelX, moneyLabelY, moneyLabelW, moneyLabelH);
    //销量的fame
    CGSize   mountSize = [self sizeWithString:_product.name font:MountFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat mountLabelH = mountSize.height;
    CGFloat mountLabelW = mountSize.width;
    CGFloat mountLabelY =  CGRectGetMaxY(self.nameF) + 5;
    CGFloat mountLabelX =  iconW - 5 - mountLabelW;
    self.nameF = CGRectMake(mountLabelX, mountLabelY, mountLabelW, mountLabelH);
    self.cellHeight = CGRectGetMaxY(self.nameF) + 5;
}



/**
*  计算文本的宽高
*  @param str     需要计算的文本
*  @param font    文本显示的字体
*  @param maxSize 文本显示的范围
*
*  @return 文本占用的真实宽高
*/
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
     NSDictionary *dict = @{NSFontAttributeName : font};
     CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end
