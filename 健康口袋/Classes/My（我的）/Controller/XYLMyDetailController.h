//
//  XYLMyDetailController.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/29.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYLMyController;
@interface XYLMyDetailController : UITableViewController
/** 头部视图高度约束对象 */
@property (nonatomic, strong)  NSLayoutConstraint *headViewHCons;
@property(strong, nonatomic)XYLMyController *parentController;
@end
