//
//  XYLGoodsController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/4.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLGoodsController.h"
#import "XYLGoods.h"
#import "XYLGoodsCell.h"
#import "XYLGoodsDetailController.h"

@interface XYLGoodsController ()
@property(strong, nonatomic)NSArray *goodsArray;
@end

@implementation XYLGoodsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商品";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:22];
    self.navigationController.navigationBar.titleTextAttributes = dict;
}

-(NSArray *)goodsArray
{
    if (_goodsArray == nil) {
        NSArray *array = plistArray(@"Goods");
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            [mutableArray addObject:[XYLGoods goodsWithDict:dict]];
        }
        _goodsArray = mutableArray;
    }
    return _goodsArray;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.goodsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYLGoodsCell *cell = [XYLGoodsCell cellWithTableView:tableView forRowAtIndexPath:indexPath];
    cell.goods = self.goodsArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XYLGoodsDetailController *goodsDetailController = [[XYLGoodsDetailController alloc]init];
    goodsDetailController.goods = self.goodsArray[indexPath.row];
    [self.navigationController pushViewController:goodsDetailController animated:YES];
    
}
@end
