//
//  XYLHoriaontalScrollCell.m
//  XYLHorizontalScroll
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 www.30pay.seb. All rights reserved.
//

#import "XYLHoriaontalScrollCell.h"
#import "XYLCollectionViewCell.h"
#import "XYLProductObject.h"
#import "XYLProductObjectFrame.h"
@interface XYLHoriaontalScrollCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation XYLHoriaontalScrollCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"productCell";
    XYLHoriaontalScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[XYLHoriaontalScrollCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 5.0f;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 375, 200) collectionViewLayout:flowLayout];
        collectionView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:collectionView];
        self.collectionView = collectionView;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellCollectionID"];
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *ID = @"cellCollectionID";
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255.0)/255.0f green:arc4random_uniform(255.0)/255.0f blue:arc4random_uniform(255.0)/255.0f alpha:0.5];
//    return cell;
    XYLCollectionViewCell *cell1 = [XYLCollectionViewCell cellWithCollection:collectionView cellForItemAtIndexPath:indexPath];
    [cell1 setProductFrame:self.dataArray[indexPath.row]];
    return cell1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(200, 200);
}

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
}
@end
