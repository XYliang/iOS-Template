//
//  XYLMyDetailController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLMyDetailController.h"
#import "XYLMyController.h"
#define XYLHeadViewH 200
#define XYLHeadViewMinH 64
#define XYLSectionH 20

@interface XYLMyDetailController ()
/** 记录下最开始的Y轴偏移量 */
@property (nonatomic, assign) CGFloat oriOffsetY;
@property(strong, nonatomic)  NSArray *dataArray;
@property(strong, nonatomic)  NSArray *titleArray;
@property(strong, nonatomic)  NSArray *dataArray2;
@property(strong, nonatomic)  NSArray *titleArray2;
@end

@implementation XYLMyDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 记录最开始y轴偏移量
    _oriOffsetY = - (XYLHeadViewH);
    self.tableView.contentInset = UIEdgeInsetsMake(XYLHeadViewH, 0, 0, 0);
    [self setupDataArray];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    // 获取当前的y轴偏移量
    CGFloat curOffsetY = scrollView.contentOffset.y;
    
    // 计算下与最开始的偏移量的差距
    CGFloat delta = curOffsetY - _oriOffsetY;

    // 计算下当前最新的头部视图高度
    CGFloat headH = XYLHeadViewH - delta;

    // 获取当前导航条背景图片透明度，当delta=136的时候，透明图刚好为1.
    CGFloat alpha = delta * 1 / 136.0;
    if (alpha >= 1) {
        alpha = 0.99;
    }
    if (headH < SmallMargin) {
        headH = 1;
    }
    // 分类：根据颜色生成一张图片
    UIImage *bgImage = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    _headViewHCons.constant = headH;
}

-(void)setupDataArray
{
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:@"收藏", @"我的订单", @"我的医生", @"清除缓存", nil];
    self.dataArray = [dataArray copy];
    NSMutableArray *titleArray = [NSMutableArray arrayWithObjects:@"我的收藏", @"我的订单", @"我的医生", @"清除缓存", nil];
    self.titleArray = [titleArray copy];
    NSMutableArray *dataArray2 = [NSMutableArray arrayWithObjects:@"注销", nil];
    self.dataArray2 = [dataArray2 copy];
    NSMutableArray *titleArray2 = [NSMutableArray arrayWithObjects:@"注销", nil];
    self.titleArray2 = [titleArray2 copy];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    switch (section) {
        case 0:
            return [_dataArray count];
            break;
        case 1:
            return [_dataArray2 count];
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *myTableViewCellIdentifier = @"myTableViewCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myTableViewCellIdentifier];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myTableViewCellIdentifier];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.font = [cell.textLabel.font fontWithSize:15];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section ==0) {
        cell.imageView.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
        cell.textLabel.text = [self.titleArray objectAtIndex:[indexPath row]];
    }else if(indexPath.section == 1){
        cell.imageView.image = [UIImage imageNamed:self.dataArray2[indexPath.row]];
        cell.textLabel.text = [self.titleArray2 objectAtIndex:[indexPath row]];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return XYLSectionH;
}

#pragma mark table view data delegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        [self.parentController logout];
    }
}

@end
