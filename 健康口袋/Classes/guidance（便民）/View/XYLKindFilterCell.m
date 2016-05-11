//
//  XYLKindFilterCell.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/28.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLKindFilterCell.h"
#import "XYLGuidanceGroupObject.h"

@interface XYLKindFilterCell ()
{
    UIImageView *_imageView;
    UILabel *_nameLabel;
    UIButton *_numberBtn;
}

@end
@implementation XYLKindFilterCell

+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *KindFilterCell = @"KindFilterCell";
    XYLKindFilterCell *cell = [tableView dequeueReusableCellWithIdentifier:KindFilterCell];
    if (cell == nil)
    {
        cell = [[XYLKindFilterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KindFilterCell];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = Color(239, 239, 239);
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 30)];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_nameLabel];
        
        _numberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _numberBtn.frame = CGRectMake(self.frame.size.width-85, 12, 80, 15);
        _numberBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        _numberBtn.layer.cornerRadius = 7;
        _numberBtn.layer.masksToBounds = YES;
        [_numberBtn setBackgroundImage:[UIImage imageNamed:@"film"] forState:UIControlStateNormal];
        [_numberBtn setBackgroundImage:[UIImage imageNamed:@"film"] forState:UIControlStateHighlighted];
        [_numberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_numberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [self.contentView addSubview:_numberBtn];
        
        //下划线
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
        lineView.backgroundColor = Color(192, 192, 192);
        [self.contentView addSubview:lineView];
    }
    return self;
    
}

-(void)setGuidanceGroupObject:(XYLGuidanceGroupObject *)guidanceGroupObject
{
    _guidanceGroupObject = guidanceGroupObject;
    _nameLabel.text = guidanceGroupObject.name;
//    if (guidanceGroupObject.list == nil) {
//        [_numberBtn setTitle:[NSString stringWithFormat:@"%@",guidanceGroupObject.count] forState:UIControlStateNormal];
//    }else{
//        [_numberBtn setTitle:[NSString stringWithFormat:@"%@>",guidanceGroupObject.count] forState:UIControlStateNormal];
//    }
//    
//    NSString *str = [NSString stringWithFormat:@"%@>",guidanceGroupObject.count];
//    CGSize textSize = [str sizeWithFont:[UIFont systemFontOfSize:11] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
//    _numberBtn.frame = CGRectMake(self.frame.size.width-10-textSize.width-10, 12, textSize.width+10, 15);
}

@end
