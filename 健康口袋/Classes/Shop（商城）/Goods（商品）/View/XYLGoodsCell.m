//
//  XYLGoodsCell.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/4.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLGoodsCell.h"

@implementation XYLGoodsCell

-(void)setGoods:(XYLGoods *)goods
{
    _goods = goods;
    self.goodsImageView.image = [UIImage imageNamed:goods.goodsImageStr];
    self.goodsNameLabel.text = goods.goodsNameStr;
    self.goodsPriceLabel.text = goods.goodsPriceStr;
    self.goodsmountsLabel.text = goods.goodsMountsStr;
}

+(instancetype)cellWithTableView:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *goodsCellID = @"goodsCellID";
    XYLGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:goodsCellID];
    if (!cell) {
        cell = xibView(@"XYLGoodsCell");
    }
    return cell;
}
@end
