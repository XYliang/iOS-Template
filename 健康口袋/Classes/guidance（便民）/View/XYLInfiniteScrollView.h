//
//  XYLInfiniteScrollView.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/26.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYLInfiniteScrollView : UIView

/**
 *  滚动间隔
 */
@property (nonatomic, assign)NSTimeInterval delayTime;
/**
 *  显示的广告图片
 */
@property (nonatomic, strong) NSArray *images;
/**
 *  页面控制指示器
 */
@property (nonatomic, weak, readonly) UIPageControl *pageControl;
/**
 *  滚动方向，no为横向，yes为竖向
 */
@property (nonatomic, assign, getter = isScrollDirectionPortrait) BOOL scrollDirectionPortrait;

@end
