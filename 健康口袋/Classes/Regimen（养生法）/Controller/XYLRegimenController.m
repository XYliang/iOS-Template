//
//  XYLRegimenController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/19.
//  Copyright © 2016年 薛银亮. All rights reserved.
//  首界面的第一个界面

#import "XYLRegimenController.h"
#import "XYLRegimenTitleView.h"
#import "XYLRegimenCenterView.h"
#import "XYLMenuButton.h"
#import "XYLSettingController.h"
#import "XYLArticleController.h"

#define XYLHomeTopH ScreenHeight / 6

@interface XYLRegimenController()<UIScrollViewDelegate>
{
    UIView *_buttonBackView;
}

@property(strong, nonatomic)UIScrollView *scrollView;
@property (nonatomic, weak)  XYLRegimenCenterView *centerView;
/**显示的title*/
@property (nonatomic, strong) NSMutableArray *showButtonTitle;
@end
@implementation XYLRegimenController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.imagesArray = @[@"运动", @"中医", @"煲汤",  @"针灸", @"食疗", @"男性", @"女性", @"小孩" , @"老人"];
    self.titlesArray = @[@"运动", @"中医", @"煲汤",  @"针灸", @"食疗", @"男性", @"女性", @"小孩" , @"老人"];
    [self setupView];
}

-(void)setupView
{
    [self setupScrollView];
    [self setupTopView];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupButtonBackView];
    BmobUser *bUser = [BmobUser getCurrentUser];
    if (bUser) {
        //进行操作
        NSLog(@"%@",bUser);
    }else{
        //对象为空时，可打开用户注册界面
    }
}

-(void)setupTopView
{
    self.view.backgroundColor = [UIColor getColor:@"F2F2F2"];
    XYLRegimenTitleView *titleView = xibView(@"XYLRegimenTitleView");
    titleView.frame = CGRectMake(0, 0, ScreenWeight, XYLHomeTopH);
    [self.scrollView addSubview:titleView];
    
    XYLRegimenCenterView *centerView = xibView(@"XYLRegimenCenterView");
    centerView.frame = CGRectMake(0, titleView.height, ScreenWeight, XYLHomeTopH);
    [self.scrollView addSubview:centerView];
    self.centerView = centerView;
}

/**
 *  设置安妮背景
 */
-(void)setupButtonBackView
{
    [self setupButtons];
}

/**
 *  添加scrollview
 */
-(void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWeight, ScreenHeight)];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = YES;
    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
}

/**
 *  功能键设置
 */
- (void)setupButtons
{
    //清空按钮数组和界面上的按钮
    self.showButtonTitle = nil;
    NSArray *views = [self.scrollView subviews];
    for (XYLMenuButton *button in views) {
        if ([button isMemberOfClass:[XYLMenuButton class]]) {
            [button removeFromSuperview];
        }
    }
    CGFloat buttonStarY = CGRectGetMaxY(self.centerView.frame) + 1;
    int totalColsCount = 3;
    CGFloat buttonW = ScreenWeight / totalColsCount;
    CGFloat buttonH = buttonW;
    self.showButtonTitle = [NSMutableArray array];
    for (int i = 0; i < self.titlesArray.count; i ++) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        BOOL isOn = [defaults boolForKey:self.titlesArray[i]];
        if (isOn == YES) {
            [self.showButtonTitle addObject:self.titlesArray[i]];
        }
    }
    //添加更多按钮
    [self.showButtonTitle addObject:@"更多"];
    for (int i = 0; i < self.showButtonTitle.count; i++) {
        XYLMenuButton *button = [[XYLMenuButton alloc] init];
        CGFloat buttonX = (i % totalColsCount) * buttonW;
        CGFloat buttonY =  (i / totalColsCount) * buttonH + 20 + buttonStarY;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:self.showButtonTitle[i]] forState:UIControlStateNormal];
        [button setTitle:self.showButtonTitle[i] forState:UIControlStateNormal];
        [self.scrollView addSubview:button];
        CGFloat maxScrollH = CGRectGetMaxY(button.frame) - _buttonBackView.height;
        self.scrollView.contentSize = CGSizeMake(0, maxScrollH + 64 + self.tabBarController.tabBar.size.height);
    }
}

- (void)buttonClick:(XYLMenuButton *)button
{
    if([button.titleLabel.text isEqualToString:@"更多"])
    {
        XYLSettingController *settingController = [[XYLSettingController alloc]init];
        [self presentViewController:settingController animated:YES completion:nil];
        
    }else //if([button.titleLabel.text isEqualToString:@"运动"])
    {
        XYLArticleController *article = [[XYLArticleController alloc]init];
        article.titleStr = button.titleLabel.text;
        article.titleImageStr = button.titleLabel.text;
        [self presentViewController:article animated:YES completion:nil];
    }


}


@end
