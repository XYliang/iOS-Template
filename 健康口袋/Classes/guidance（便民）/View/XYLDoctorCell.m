//
//  XYLDoctorCell.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/28.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLDoctorCell.h"
#import "XYLDoctorObject.h"

@implementation XYLDoctorCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"doctorCell";
    XYLDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XYLDoctorCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)setDoctorObject:(XYLDoctorObject *)doctorObject
{
    _doctorObject = doctorObject;
    
    self.doctorName.text = doctorObject.doctorName;
    self.doctorHospital.text = doctorObject.doctorHospital;
    self.doctorPrice.text = doctorObject.doctorPrice;
    self.doctorWorkTime.text = doctorObject.doctorWorkTime;
    UIImage *image = [UIImage imageNamed:doctorObject.doctorIcon];
    self.doctorIcon.image = [UIImage createRoundedRectImage:image];
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.y+=10;
    frame.size.height-=10;
    [super setFrame:frame];
}

@end
