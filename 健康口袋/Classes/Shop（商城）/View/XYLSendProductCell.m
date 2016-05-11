//
//  XYLSendProductCell.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/25.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLSendProductCell.h"
#import "XYLStyleTitleView.h"

@interface XYLSendProductCell()<XYLStyleTitleViewDelegate>

@end
@implementation XYLSendProductCell

+ (instancetype)cellWithTableView:(UITableView *)tableView withTitleString:(NSString *)titleString withDataArray:(NSArray *)dataArray
{
    NSString *identifier = [NSString stringWithFormat:@"%@",titleString];
    XYLSendProductCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier withTitleString:titleString withDataArray:dataArray];
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withTitleString:(NSString *)titleString withDataArray:(NSArray *)dataArray
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        XYLStyleTitleView *styleTitleView = [XYLStyleTitleView styleTitleView:titleString withButtonDataArray:dataArray];
        styleTitleView.delegate = self;
        self.cellHeight = styleTitleView.height;
        styleTitleView.frame = CGRectMake(0, 0, ScreenWeight, self.cellHeight);
        [self.contentView addSubview:styleTitleView];
        self.styleTitleView = styleTitleView;
    }
    return self;
}


-(void)styleTitleView:(XYLStyleTitleView *)styleTitleView didSelectedWithButtonTitle:(NSString *)buttonTitle
{
    if ([self.delegate conformsToProtocol:@protocol(XYLSendProductCellDelegate)]&&[self.delegate respondsToSelector:@selector(sendProductCellWithSelectedWithButtonTitle:)])
    {
        [self.delegate sendProductCellWithSelectedWithButtonTitle:buttonTitle];
    }

}

@end
