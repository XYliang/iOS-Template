//
//  XYLKindSubclassFilterCell.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/28.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLKindSubclassFilterCell.h"
#import "XYLGuidanceGroupObject.h"

@implementation XYLKindSubclassFilterCell

+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath model:(XYLGuidanceGroupObject *)model{
    static NSString *kindSubclassFilter = @"KindSubclassFilterCell";
    XYLKindSubclassFilterCell *cell = [tableView dequeueReusableCellWithIdentifier:kindSubclassFilter];
    if (cell == nil) {
        cell = [[XYLKindSubclassFilterCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kindSubclassFilter];
    }
    cell.textLabel.text = [model.list [indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [model.list [indexPath.row] objectForKey:@"count"]];
    
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
    cell.backgroundColor = Color(242, 242, 242);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


@end
