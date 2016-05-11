//
//  XYLGoodsCell.h
//  健康口袋
//
//  Created by 薛银亮 on 16/3/4.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYLGoods.h"

@interface XYLGoodsCell : UITableViewCell
/**
 *  商品图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
/**
 *  商品名字
 */
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
/**
 *  商品价格
 */
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;
/**
 *  商品销售数量
 */
@property (weak, nonatomic) IBOutlet UILabel *goodsmountsLabel;

@property(strong, nonatomic)XYLGoods *goods;

+(instancetype)cellWithTableView:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath;
@end
