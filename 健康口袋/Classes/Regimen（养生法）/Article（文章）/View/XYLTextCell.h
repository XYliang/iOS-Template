//
//  XYLTextCell.h
//  健康口袋
//
//  Created by 薛银亮 on 16/3/3.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYLTextObjectFrame.h"

@interface XYLTextCell : UITableViewCell

@property(strong, nonatomic)XYLTextObjectFrame *textObjectFrame;

+(instancetype)cellWithTableView:(UITableView *)tableView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
