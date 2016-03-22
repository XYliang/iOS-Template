//
//  XYLProductObjectFrame.h
//  XYLHorizantorScrollCell
//
//  Created by 薛银亮 on 16/2/24.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class XYLProductObject;

@interface XYLProductObjectFrame : NSObject

@property(assign,nonatomic) CGRect nameF;
@property(assign,nonatomic) CGRect iconF;
@property(assign,nonatomic) CGRect amountF;
@property(assign,nonatomic) CGRect moneyF;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) XYLProductObject *product;

@end
