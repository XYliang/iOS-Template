//
//  XYLFileterView.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/27.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYLFileterViewDelegate <NSObject>

@optional
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath withId:(NSNumber *)ID ;

@end

@interface XYLFileterView : UIView
/**
 *  全部分类的tableView
 */
@property(nonatomic, strong) UITableView *tableViewOfGroup;

/**
 *  每组详情的tableView
 */
@property(nonatomic, strong) UITableView *tableViewOfDetail;
@property (nonatomic, weak) id <XYLFileterViewDelegate> delegate;
@end
