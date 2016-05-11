//
//  XYLFireBestView.h
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYLProductObject, XYLFireBestView;

@protocol  XYLFireBestViewDelegate<NSObject>
-(void)fireBestView:(XYLFireBestView *)fireBestView  productObject:(XYLProductObject *)productObject;
@end

@interface XYLFireBestView : UIView
@property(weak, nonatomic)id<XYLFireBestViewDelegate> delegate;
@property(strong, nonatomic)NSArray *dataArray;
@end
