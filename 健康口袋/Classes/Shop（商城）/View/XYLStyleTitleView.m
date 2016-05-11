//
//  XYLStyleTitleView.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/25.
//  Copyright © 2016年 薛银亮. All rights reserved.
//  类别选项的界面封装

#import "XYLStyleTitleView.h"
#import "XYLButtonDataObject.h"
#import "XYLToolButton.h"

@implementation XYLStyleTitleView

+(instancetype)styleTitleView:(NSString *)titleString withButtonDataArray:(NSArray *)buttonDataArray
{
    return [[self alloc]initWithString:titleString withButtonDataArray:buttonDataArray];
}

-(instancetype)initWithString:(NSString *)titleString withButtonDataArray:(NSArray *)buttonDataArray
{
    if (self = [super init]) {
        
        UIFont *font = [UIFont systemFontOfSize:13];
        self.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(MaxMargin, 0, 100, 60.0)];
        self.titleLabel = titleLabel;
        self.buttonsArray = buttonDataArray;
        titleLabel.text = titleString;
        titleLabel.font=font;
        titleLabel.textColor = [UIColor getColor:@"2c2c2c"];
        CGFloat lineViewHeight = 1;
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(MaxMargin, self.titleLabel.frame.size.height, ScreenWeight - 2*MaxMargin, lineViewHeight)];
        lineView.backgroundColor = [UIColor getColor:@"dcdcdc"];
        [self addSubview:lineView];
        [self addSubview:titleLabel];
        
        //添加功能按钮
        int numberHorizontal = 3;
        CGFloat buttonW = ScreenWeight / 3.0f;
        CGFloat buttonH = 60;
        for (int i =0; i < buttonDataArray.count; i ++) {
            CGFloat buttonX = (i % numberHorizontal) * buttonW;
            CGFloat buttonY = (i / numberHorizontal) * buttonH + CGRectGetMaxY(lineView.frame) + 2*MaxMargin;
            XYLButtonDataObject *buttonObject = buttonDataArray[i];
            XYLToolButton *btn = [[XYLToolButton alloc]initWithFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
            [btn setTitle:buttonObject.titleString forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(toolButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
            [btn setImage:[UIImage imageNamed:buttonObject.iconString] forState:UIControlStateNormal];
            [self addSubview:btn];
            self.height = CGRectGetMaxY(btn.frame) + MaxMargin;
        }
        
    }
    return  self;
}



-(void)toolButtonSelected:(XYLToolButton *)sender
{
    if ([self.delegate conformsToProtocol:@protocol(XYLStyleTitleViewDelegate)]&&[self.delegate respondsToSelector:@selector(styleTitleView:didSelectedWithButtonTitle:)])
    {
        [self.delegate styleTitleView:self didSelectedWithButtonTitle:sender.titleLabel.text];
    }

}

@end
