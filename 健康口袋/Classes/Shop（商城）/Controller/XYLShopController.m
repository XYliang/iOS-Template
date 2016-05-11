//
//  XYLShopController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLShopController.h"
#import "XYLHorizantorScrollCell.h"
#import "XYLProductObject.h"
#import "XYLProductObjectFrame.h"
#import "XYLButtonDataObject.h"
#import "XYLSendProductCell.h"
#import "XYLGoodsController.h"

@interface XYLShopController()<XYLSendProductCellDelegate,XYLHorizantorScrollCellDelegate>
@property (nonatomic, strong) NSArray *productFrameArray;
@property(strong, nonatomic)NSArray *sendParentsArray;
@property(strong, nonatomic)NSArray *sendHeOrSheArray;
@property(strong, nonatomic)NSArray *baobaoArray;
@property(strong, nonatomic)NSArray *lifeMustArray;


@end
@implementation XYLShopController

#pragma  mark - 代理方法
-(void)sendProductCellWithSelectedWithButtonTitle:(NSString *)buttonTitle
{
    NSLog(@"---------------%@",buttonTitle);
    XYLGoodsController *goodsController = [[XYLGoodsController alloc]init];
    [self.navigationController pushViewController:goodsController animated:YES];
}

-(NSArray *)productFrameArray
{
    if (_productFrameArray == nil) {
        NSArray *dictArray =plistArray(@"Products");
        NSMutableArray *productArray = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            XYLProductObject *product = [XYLProductObject productWithDict:dict];
            XYLProductObjectFrame *productFrame = [[XYLProductObjectFrame alloc]init];
            productFrame.product = product;
            [productArray addObject:productFrame];
        }
        _productFrameArray = [productArray copy];
    }
    return _productFrameArray;
}

-(NSArray *)sendParentsArray
{
    if (_sendParentsArray == nil) {
        NSArray *dictArray =plistArray(@"SendParents");
        NSMutableArray *objectArray = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            XYLButtonDataObject *buttonObject = [XYLButtonDataObject objectWithDict:dict];
            [objectArray addObject:buttonObject];
        }
        _sendParentsArray = [objectArray copy];
    }
    return _sendParentsArray;
}

-(NSArray *)sendHeOrSheArray
{
    if (_sendHeOrSheArray == nil) {
        NSArray *dictArray =plistArray(@"SendHeOrShe");
        NSMutableArray *objectArray = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            XYLButtonDataObject *buttonObject = [XYLButtonDataObject objectWithDict:dict];
            [objectArray addObject:buttonObject];
        }
        _sendHeOrSheArray = [objectArray copy];
    }
    return _sendHeOrSheArray;
}

-(NSArray *)baobaoArray
{
    if (_baobaoArray == nil) {
        NSArray *dictArray =plistArray(@"Baobao");
        NSMutableArray *objectArray = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            XYLButtonDataObject *buttonObject = [XYLButtonDataObject objectWithDict:dict];
            [objectArray addObject:buttonObject];
        }
        _baobaoArray = [objectArray copy];
    }
    return _baobaoArray;
}

-(NSArray *)lifeMustArray
{
    if (_lifeMustArray == nil) {
        NSArray *dictArray =plistArray(@"LifeMust");
        NSMutableArray *objectArray = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            XYLButtonDataObject *buttonObject = [XYLButtonDataObject objectWithDict:dict];
            [objectArray addObject:buttonObject];
        }
        _lifeMustArray = [objectArray copy];
    }
    return _lifeMustArray;
}


-(void)viewDidLoad
{
    self.tableView.allowsSelection = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.view.backgroundColor = [UIColor getColor:@"F2F2F2"];
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWeight, 40)];
    headView.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(MaxMargin, MaxMargin, 100, 24)];
    titleLabel.textColor =  [UIColor getColor:@"2c2c2c"];
    titleLabel.text = @"最热商品";
    titleLabel.font = [UIFont systemFontOfSize:13];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(MaxMargin,CGRectGetMaxY(titleLabel.frame) + MaxMargin, ScreenWeight - 2*MaxMargin, 1)];
    lineView.backgroundColor = [UIColor getColor:@"dcdcdc"];
    [headView addSubview:titleLabel];
    [headView addSubview:lineView];
    self.tableView.tableHeaderView = headView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        XYLHorizantorScrollCell *cell = [XYLHorizantorScrollCell cellWithTableView:tableView];
        cell.delegate = self;
        cell.dataArray = self.productFrameArray;
        return cell;
    }else if(indexPath.section == 1){
        XYLSendProductCell *productCell = [XYLSendProductCell cellWithTableView:tableView withTitleString:@"送父母" withDataArray:self.sendParentsArray];
        productCell.delegate = self;
        return productCell;
    }
    else if(indexPath.section == 2){
        XYLSendProductCell *productCell = [XYLSendProductCell cellWithTableView:tableView withTitleString:@"送他Or她" withDataArray:self.sendHeOrSheArray];
        productCell.delegate = self;
        return productCell;
    }
    else if(indexPath.section == 3){
        XYLSendProductCell *productCell = [XYLSendProductCell cellWithTableView:tableView withTitleString:@"送宝宝" withDataArray:self.baobaoArray];
        productCell.delegate = self;
        return productCell;
    }
    else if(indexPath.section == 4){
        XYLSendProductCell *productCell = [XYLSendProductCell cellWithTableView:tableView withTitleString:@"生活必备" withDataArray:self.lifeMustArray];
        productCell.delegate = self;
        return productCell;
    }
    return [[UITableViewCell alloc]init];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 220;
    }
    if(indexPath.section == 4){
        return 151;
    }else{
        return  331;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 10;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, self.navigationController.navigationBar.frame.size.height+self.tabBarController.tabBar.frame.size.height + 10, -0);
        scrollView.contentInset = insets;
    }
}

#pragma mark - 代理方法
-(void)horizantorScrollCell:(XYLHorizantorScrollCell *)horizantorScrollCell productObject:(XYLProductObject *)productObject
{
    XYLGoodsController *goodsController = [[XYLGoodsController alloc]init];
    
    [self.navigationController pushViewController:goodsController animated:YES];
}

@end
