//
//  XYLMyController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLMyController.h"
#import "XYLMyDetailController.h"
#import "XYLLoginController.h"

@interface XYLMyController()<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHCons;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong) XYLMyDetailController *detailVc;
@end

@implementation XYLMyController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.headImageView.image = [UIImage createRoundedRectImage:[UIImage imageNamed:@"doctor1"]];
    self.view.backgroundColor = [UIColor getColor:@"F2F2F2"];
    // 清空导航条背景图片,系统判断当前是否为Nil,如果为nil,系统还是会自动生成一张背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self setUpAllChildViewController];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

// 添加所有的子控制器
- (void)setUpAllChildViewController
{
    XYLMyDetailController *detailVc = [[XYLMyDetailController alloc]initWithNibName:@"XYLMyDetailController" bundle:nil];
    detailVc.headViewHCons = _headViewHCons;
    detailVc.view.frame = self.contentView.bounds;
    detailVc.parentController = self;
    [self addChildViewController:detailVc];
    [self.contentView addSubview:detailVc.view];
    _detailVc = detailVc;
}

- (void)logout {
    
    // 弹出actionSheet
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否注销" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    { // 点击注销
        [self presentViewController: [[XYLLoginController alloc]init] animated:YES completion:nil];
    }
}

@end
