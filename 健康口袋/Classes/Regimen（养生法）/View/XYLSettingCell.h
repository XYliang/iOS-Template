//
//  XYLSettingCell.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYLSettingItem;

@interface XYLSettingCell : UITableViewCell

@property(nonatomic, strong) XYLSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *) tableView;

@end
