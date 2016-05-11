//
//  XYLHorizontalScrollController.m
//  XYLHorizontalScroll
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 www.30pay.seb. All rights reserved.
//

#import "XYLHorizontalScrollController.h"
#import "XYLHoriaontalScrollCell.h"
#import "XYLProductObject.h"
#import "XYLProductObjectFrame.h"

@interface XYLHorizontalScrollController()
@property (nonatomic, strong) NSArray *productFrameArray;

@end
@implementation XYLHorizontalScrollController

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(NSArray *)productFrameArray
{
    if (_productFrameArray == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"Products" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYLHoriaontalScrollCell *cell = [XYLHoriaontalScrollCell cellWithTableView:tableView];
    cell.dataArray = self.productFrameArray;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        NSLog(@"indexPath section%ld",[indexPath section]);
        NSLog(@"rows === %ld",[indexPath row]);
}


@end
