//
//  XYLMenuButton.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/22.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLMenuButton.h"

@implementation XYLMenuButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 图片
    self.imageView.y = self.height * 0.1;
    self.imageView.height = self.height * 0.55;
    self.imageView.width = self.imageView.height;
    self.imageView.centerX = self.width * 0.5;
    
    // 文字
    self.titleLabel.width = self.width;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.height = self.height - self.titleLabel.y;
    self.titleLabel.x = 0;
    
}


@end
