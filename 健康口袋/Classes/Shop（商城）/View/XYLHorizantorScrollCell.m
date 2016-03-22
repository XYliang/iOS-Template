//
//  XYLHorizantorScrollCell.m
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLHorizantorScrollCell.h"
#import "XYLFireBestView.h"

@interface XYLHorizantorScrollCell()
@property(weak, nonatomic)XYLFireBestView *fireBestView;
@end

@implementation XYLHorizantorScrollCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
     static NSString *identifier = @"productCell";
    XYLHorizantorScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
         cell = [[XYLHorizantorScrollCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
     }
     return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        XYLFireBestView *fireBestView = [[XYLFireBestView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        [self.contentView addSubview:fireBestView];
        self.fireBestView = fireBestView;
    }
    return self;
}

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    self.fireBestView.dataArray = _dataArray;
}

@end
