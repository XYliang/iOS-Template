//
//  XYLStyleTitleView.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/25.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYLStyleTitleView;
@protocol XYLStyleTitleViewDelegate <NSObject>

-(void)styleTitleView:(XYLStyleTitleView *)styleTitleView didSelectedWithButtonTitle:(NSString *)buttonTitle;

@end
@interface XYLStyleTitleView : UIView
/**高度*/
@property (nonatomic, assign) CGFloat height;

@property(weak, nonatomic)UILabel *titleLabel;
@property(strong, nonatomic)NSArray *buttonsArray;

@property(weak, nonatomic)id<XYLStyleTitleViewDelegate> delegate;
//+(instancetype)styleTitleView:(NSString *)titleString frame:(CGRect)frame withButtonDataArray:(NSArray *)buttonDataArray;
+(instancetype)styleTitleView:(NSString *)titleString withButtonDataArray:(NSArray *)buttonDataArray;
@end
