//
//  XYLTabBarButton.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

//按钮图标所占按钮中的高度的比例
#define XYLTabBarButtonImageRatio 0.65
//按钮默认的颜色
#define XYLTabBarButtonTitleColor (ios7 ? [UIColor getColor:@"949494"]: [UIColor getColor:@"949494"])
//按钮选中的颜色
#define XYLTabBarButtonTitleSelectedColor (ios7 ? [UIColor getColor:@"00CC99"]: [UIColor getColor:@"00CC99"])

#import "XYLTabBarButton.h"

@implementation XYLTabBarButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.imageView.contentMode = UIViewContentModeBottom;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = Font(11);
        [self setTitleColor:XYLTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:XYLTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
        [self setBackgroundColor:[UIColor getColor:@"FFFFFF"]];
    }
    return  self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * XYLTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * XYLTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    //KVO监听属性改变
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

//释放KVO监听
-(void)dealloc
{
//    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}
//监听到某个对像到属性改了，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}


@end
