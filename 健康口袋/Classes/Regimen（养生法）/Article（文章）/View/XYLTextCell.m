//
//  XYLTextCell.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/3.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLTextCell.h"
#import "XYLTextObjectFrame.h"
#import "XYLTextObject.h"

@interface XYLTextCell ()
@property(weak, nonatomic)UILabel *titleLabel;
@property(weak, nonatomic)UIImageView *textImageView;
@property(weak, nonatomic)UITextView *textView;
@end
@implementation XYLTextCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *label = [[UILabel alloc]init];
        self.titleLabel = label;
        [self.contentView addSubview:label];
        
        UIImageView *imageView = [[UIImageView alloc]init];
        self.textImageView = imageView;
        [self.contentView addSubview:imageView];
        
        UITextView *textView = [[UITextView alloc]init];
        self.textView = textView ;
        textView.editable = NO;
        textView.textColor = [UIColor darkGrayColor];
        textView.font = [UIFont systemFontOfSize:19];
        [self.contentView addSubview:textView];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"textCellID";
    XYLTextCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYLTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(void)setTextObjectFrame:(XYLTextObjectFrame *)textObjectFrame
{
    _textObjectFrame = textObjectFrame;
    [self setupData];
    [self setupFrame];
}

-(void)setupData
{
    XYLTextObject *object = self.textObjectFrame.textObject;
    self.titleLabel.text = object.title;
    self.textImageView.image = [UIImage imageNamed:object.imageStr];
    self.textView.text = object.textStr;
}

-(void)setupFrame
{
    self.titleLabel.frame = self.textObjectFrame.cellTitleF;
    self.textImageView.frame = self.textObjectFrame.cellImageViewF;
    self.textView.frame = self.textObjectFrame.cellTextViewF;
}

@end
