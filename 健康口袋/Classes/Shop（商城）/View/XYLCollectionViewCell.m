//
//  XYLCollectionViewCell.m
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLCollectionViewCell.h"
#import "XYLProductObject.h"
#import "XYLProductObjectFrame.h"


@interface XYLCollectionViewCell()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;
@property(weak, nonatomic)UILabel *moneyLabel;
@property(weak, nonatomic)UILabel *amountLabel;

@end

@implementation XYLCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.font = [UIFont systemFontOfSize:15];
        nameLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *moneyLabel = [[UILabel alloc]init];
        moneyLabel.font = [UIFont systemFontOfSize:15];
        moneyLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:moneyLabel];
        self.moneyLabel = moneyLabel;
        
        UILabel *amountLabel = [[UILabel alloc]init];
        amountLabel.font = [UIFont systemFontOfSize:13];
        amountLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:amountLabel];
        self.amountLabel = amountLabel;
    }
    return self;
}

+(instancetype)cellWithCollection:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellCollectionID = @"cellCollectionID";
    XYLCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellCollectionID forIndexPath:indexPath];
    return collectionCell;
}


-(void)setProductFrame:(XYLProductObjectFrame *)productFrame
{
    _productFrame = productFrame;
    [self setupData];
    [self setupFrame];
}

-(void)setupData
{
    XYLProductObject *product = self.productFrame.product;
    self.iconView.image = [UIImage imageNamed:product.icon];
    self.nameLabel.text  = product.name;
    self.moneyLabel.text = product.money;
    self.amountLabel.text = product.amount;
}

-(void)setupFrame
{
    self.iconView.frame = self.productFrame.iconF;
    self.nameLabel.frame = self.productFrame.nameF;
    self.moneyLabel.frame = self.productFrame.moneyF;
    self.amountLabel.frame = self.productFrame.amountF;
}


@end
