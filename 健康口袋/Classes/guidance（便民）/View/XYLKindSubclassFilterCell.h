//
//  XYLKindSubclassFilterCell.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/28.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYLGuidanceGroupObject;
@interface XYLKindSubclassFilterCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath model:(XYLGuidanceGroupObject *)model;
@end
