//
//  XYLFireBestView.m
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLFireBestView.h"
#import "XYLProductObjectFrame.h"
#import "XYLProductObject.h"
#import "XYLCollectionViewCell.h"

@interface XYLFireBestView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collectionView;
@end

@implementation XYLFireBestView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 5.0f;
        UICollectionView *collectionVeiw = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, frame.size.height) collectionViewLayout:flowLayout];
        collectionVeiw.backgroundColor = [UIColor whiteColor];
        collectionVeiw.showsHorizontalScrollIndicator = NO;
        [self addSubview:collectionVeiw];
        self.collectionView = collectionVeiw;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerClass:[XYLCollectionViewCell class] forCellWithReuseIdentifier:@"cellCollectionID"];
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XYLCollectionViewCell *cell = [XYLCollectionViewCell cellWithCollection:collectionView cellForItemAtIndexPath:indexPath];
    cell.productFrame = self.dataArray[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(140, self.frame.size.height);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
}


@end
