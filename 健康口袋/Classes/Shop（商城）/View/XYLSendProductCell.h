//
//  XYLSendProductCell.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/25.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYLSendProductCell;
@class XYLStyleTitleView;
@protocol XYLSendProductCellDelegate <NSObject>

-(void)sendProductCellWithSelectedWithButtonTitle:(NSString *)buttonTitle;

@end

@interface XYLSendProductCell : UITableViewCell


@property (nonatomic, assign) CGFloat cellHeight;
@property(strong, nonatomic)NSArray *dataArray;
@property(strong, nonatomic)XYLStyleTitleView *styleTitleView;

@property(weak, nonatomic)id<XYLSendProductCellDelegate> delegate;
+ (instancetype)cellWithTableView:(UITableView *)tableView withTitleString:(NSString *)titleString withDataArray:(NSArray *)dataArray;
@end
