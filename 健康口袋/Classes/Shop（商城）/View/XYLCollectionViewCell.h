//
//  XYLCollectionViewCell.h
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYLProductObjectFrame;
@interface XYLCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) XYLProductObjectFrame *productFrame;
+ (instancetype)cellWithCollection:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
