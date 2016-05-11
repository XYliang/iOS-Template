//
//  XYLTitleButton.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/19.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLTitleButton.h"

@implementation XYLTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor getColor:@"E4E4E4"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:18];
    }
    return self;
}

/**
 *  重写这个方法的目的：去掉父类在highlighted时做的一切操作
 */
- (void)setHighlighted:(BOOL)highlighted {}


@end
