//
//  XYLSettingLoveController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLSettingLoveController.h"

@interface XYLSettingLoveController ()

@end

@implementation XYLSettingLoveController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    self.view.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
