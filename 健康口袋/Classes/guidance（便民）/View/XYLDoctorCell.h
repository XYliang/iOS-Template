//
//  XYLDoctorCell.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/28.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYLDoctorObject;
@interface XYLDoctorCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *doctorName;
@property (weak, nonatomic) IBOutlet UILabel *doctorPrice;
@property (weak, nonatomic) IBOutlet UIImageView *doctorIcon;
@property (weak, nonatomic) IBOutlet UILabel *doctorHospital;
@property (weak, nonatomic) IBOutlet UILabel *doctorWorkTime;
@property (nonatomic, strong)XYLDoctorObject *doctorObject;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
