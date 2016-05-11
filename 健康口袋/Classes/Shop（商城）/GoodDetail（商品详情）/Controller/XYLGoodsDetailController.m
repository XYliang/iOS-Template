//
//  XYLGoodsDetailController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/7.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLGoodsDetailController.h"
#import "XYLGoods.h"

@interface XYLGoodsDetailController ()
@property (weak, nonatomic) IBOutlet UIScrollView *goodsDetailScrollerView;
@property(weak, nonatomic)UIImageView *goodsImageView;
@property(weak, nonatomic)UILabel *goodsNameLabel;
@property(weak, nonatomic)UILabel *goodsPriceLabel;
@property(weak, nonatomic)UILabel *goodsMountsLabel;
@property(strong, nonatomic)UITextView *goodsEfficacyTextView;       //功效
@property(strong, nonatomic)UITextView *goodsAllopathyTextView;    //对症
@property(strong, nonatomic)UITextView *goodsCrowdsTextView;       //人群
@property(strong, nonatomic)UITextView *goodsNotesTextView;          //注意
@end

@implementation XYLGoodsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(void)setupView
{
    self.navigationItem.title = @"商品详情";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:22];
    self.navigationController.navigationBar.titleTextAttributes = dict;

    //图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, ScreenWeight - 30, 200)];
    self.goodsImageView = imageView;
    imageView.image = [UIImage imageNamed:self.goods.goodsImageStr];
    [self.goodsDetailScrollerView addSubview:imageView];
    //名字
    UILabel *goodsNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(imageView.frame) + 10, imageView.width / 2.0f, 20)];
    goodsNameLabel.font = [UIFont systemFontOfSize:19];
    self.goodsNameLabel = goodsNameLabel;
    goodsNameLabel.text = self.goods.goodsNameStr;
    [self.goodsDetailScrollerView addSubview:goodsNameLabel];
    //价格
    UILabel *goodsPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(goodsNameLabel.frame) + 10, CGRectGetMaxY(imageView.frame) + 10, imageView.width / 4.0f, 20)];
    goodsPriceLabel.font = [UIFont systemFontOfSize:19];
    goodsPriceLabel.textColor = [UIColor redColor];
    self.goodsPriceLabel = goodsPriceLabel;
    goodsPriceLabel.text = self.goods.goodsPriceStr;
    [self.goodsDetailScrollerView addSubview:goodsPriceLabel];
    //销量
    UILabel *goodsMountsLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(goodsPriceLabel.frame)+5, CGRectGetMaxY(imageView.frame) + 10, imageView.width / 4.0f - 10, 20)];
    goodsMountsLabel.font = [UIFont systemFontOfSize:15];
    goodsMountsLabel.textColor = [UIColor darkGrayColor];
    self.goodsMountsLabel = goodsMountsLabel;
    goodsMountsLabel.text = self.goods.goodsMountsStr;
    [self.goodsDetailScrollerView addSubview:goodsMountsLabel];
    //**/////////////////////
    //功效
    UILabel *efficacyTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(goodsNameLabel.frame)+10, ScreenWeight - 23, 20)];
    efficacyTitle.textColor = [UIColor orangeColor];
    efficacyTitle.text = @"功效";
    efficacyTitle.font = [UIFont systemFontOfSize:19];
    [self.goodsDetailScrollerView addSubview:efficacyTitle];
    
    UITextView *goodsEfficacyTextView = [[UITextView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(efficacyTitle.frame)+10, ScreenWeight-30,  [_goods.goodsEfficacyStr sizeWithFont:[UIFont systemFontOfSize:17] maxSize:CGSizeMake(ScreenWeight - 30, MAXFLOAT)].height)];
    goodsEfficacyTextView.text = _goods.goodsEfficacyStr;
    goodsEfficacyTextView.editable = NO;
    goodsEfficacyTextView.scrollEnabled = NO;
    goodsEfficacyTextView.textColor = efficacyTitle.textColor;
    goodsEfficacyTextView.font = [UIFont systemFontOfSize:17];
    self.goodsEfficacyTextView = goodsEfficacyTextView;
    [self.goodsDetailScrollerView addSubview:goodsEfficacyTextView];
    //对症
    UILabel *allopathyTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(goodsEfficacyTextView.frame)+10, ScreenWeight - 30, 20)];
    allopathyTitle.textColor = [UIColor darkGrayColor];
    allopathyTitle.text = @"对症";
    allopathyTitle.font = [UIFont systemFontOfSize:19];
    [self.goodsDetailScrollerView addSubview:allopathyTitle];

    UITextView *goodsAllopathyTextView = [[UITextView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(allopathyTitle.frame)+10, ScreenWeight-30, [_goods.goodsAllopathyStr sizeWithFont:[UIFont systemFontOfSize:17] maxSize:CGSizeMake(ScreenWeight - 30, MAXFLOAT)].height)];
    goodsAllopathyTextView.editable = NO;
    goodsAllopathyTextView.scrollEnabled = NO;
    goodsAllopathyTextView.text = _goods.goodsAllopathyStr;
    goodsAllopathyTextView.textColor = allopathyTitle.textColor;
    goodsAllopathyTextView.font = [UIFont systemFontOfSize:17];
    self.goodsAllopathyTextView = goodsAllopathyTextView;
    [self.goodsDetailScrollerView addSubview:goodsAllopathyTextView];
    //人群
    UILabel *crowdsTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(goodsAllopathyTextView.frame)+10, ScreenWeight - 30, 20)];
    crowdsTitle.textColor = [UIColor darkGrayColor];
    crowdsTitle.text = @"人群";
    crowdsTitle.font = [UIFont systemFontOfSize:19];
    [self.goodsDetailScrollerView addSubview:crowdsTitle];
    
    UITextView *goodsCrowdsTextView = [[UITextView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(crowdsTitle.frame)+10, ScreenWeight-30, [_goods.goodsCrowdsStr sizeWithFont:[UIFont systemFontOfSize:17] maxSize:CGSizeMake(ScreenWeight - 30, MAXFLOAT)].height)];
    goodsCrowdsTextView.editable = NO;
    goodsCrowdsTextView.scrollEnabled = NO;
    goodsCrowdsTextView.text = _goods.goodsCrowdsStr;
    goodsCrowdsTextView.textColor = allopathyTitle.textColor;
    goodsCrowdsTextView.font = [UIFont systemFontOfSize:17];
    self.goodsCrowdsTextView = goodsCrowdsTextView;
    [self.goodsDetailScrollerView addSubview:goodsCrowdsTextView];
    //注意
    UILabel *notesTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(goodsCrowdsTextView.frame)+10, ScreenWeight - 30, 20)];
    notesTitle.textColor = [UIColor redColor];
    notesTitle.text = @"注意";
    notesTitle.font = [UIFont systemFontOfSize:19];
    [self.goodsDetailScrollerView addSubview:notesTitle];
    
    UITextView *goodsNotesTextView = [[UITextView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(notesTitle.frame)+10, ScreenWeight-30, [_goods.goodsNotesStr sizeWithFont:[UIFont systemFontOfSize:17] maxSize:CGSizeMake(ScreenWeight - 30, MAXFLOAT)].height)];
    goodsNotesTextView.editable = NO;
    goodsNotesTextView.scrollEnabled = NO;
    goodsNotesTextView.text = _goods.goodsNotesStr;
    goodsNotesTextView.textColor = allopathyTitle.textColor;
    goodsNotesTextView.font = [UIFont systemFontOfSize:17];
    self.goodsNotesTextView = goodsNotesTextView;
    [self.goodsDetailScrollerView addSubview:goodsNotesTextView];
    self.goodsDetailScrollerView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    self.goodsDetailScrollerView.contentSize = CGSizeMake(ScreenWeight, CGRectGetMaxY(goodsNotesTextView.frame));
}

-(void)setGoods:(XYLGoods *)goods
{
    _goods = goods;
    self.goodsImageView.image = [UIImage imageNamed:goods.goodsImageStr];
    self.goodsNameLabel.text = goods.goodsNameStr;
    self.goodsPriceLabel.text = goods.goodsPriceStr;
    self.goodsMountsLabel.text = goods.goodsMountsStr;
}
@end
