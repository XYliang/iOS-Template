//
//  XYLSelectController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLSelectController.h"
#import "XYLSettingGroup.h"
#import "XYLSettingCell.h"
#import "XYLSettingItem.h"
#import "XYLArrowSettingItem.h"
#import "XYLLabelSettingItem.h"
#import "XYLSwitchSettingItem.h"

@interface XYLSelectController ()
{
    NSMutableArray *_selectedOptionsArray;
}

@end

@implementation XYLSelectController

/** 重写初始化方法
 * 一定要使用group样式
 */
- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWeight, 64)];
    headView.backgroundColor = NavigationBarColor;
    UIButton *deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 26, 30, 30)];
    [deleteButton setImage:[UIImage imageNamed:@"deleteButton"] forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deleteButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:deleteButton];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWeight/2.0 - 50, 26, 100, 30)];
    titleLabel.text = @"类别";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:titleLabel];
    self.tableView.tableHeaderView = headView;
    
    //添加滑动手势
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(deleteButtonSelected)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGestureRecognizer];
}

-(void)deleteButtonSelected
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** 加载空数据 */
- (NSMutableArray *)data {
    if (nil == _data) {
        _data = [NSMutableArray array];
    }
    return _data;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    XYLSettingGroup *group = self.data[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYLSettingCell *cell = [XYLSettingCell cellWithTableView:tableView];
    XYLSettingGroup *group = self.data[indexPath.section];
    cell.item = group.items[indexPath.row];
    return cell;
}


#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 2.1加载点击事件
    XYLSettingGroup *group = self.data[indexPath.section];
    XYLSettingItem *item = group.items[indexPath.row];
    
    // 2.2如果配置有block， 运行block
    if (item.runningBlock) {
        item.runningBlock();
    }
    
    // 2.3配置跳转控制器
    if ([item isKindOfClass:[XYLArrowSettingItem class]]) { // 如果是跳转类型的item
        XYLArrowSettingItem *arrowItem = (XYLArrowSettingItem *) item;
        
        if (nil != arrowItem.destinationViewControllerClass) {
            UIViewController *viewController = [[arrowItem.destinationViewControllerClass alloc] init];
            viewController.title = arrowItem.title;
            [self.navigationController pushViewController:viewController animated:YES];
        }
    }
}

/** 组头部 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    XYLSettingGroup *group = self.data[section];
    return group.headerTitle;
}

/** 组尾部 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    XYLSettingGroup *group = self.data[section];
    return group.tailTitle;
}

@end
