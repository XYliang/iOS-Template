//
//  XYLHorizantorScrollCell.h
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYLHorizantorScrollCell : UITableViewCell
/**
 *  显示的数据
 */
@property(strong, nonatomic)NSArray *dataArray;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
