//
//  XYLHomeController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLHomeController.h"
#import "XYLTitleButton.h"
#import "XYLShopController.h"
#import "XYLRegimenController.h"


@interface XYLHomeController()<UIScrollViewDelegate>

/** scrollView: 所有控制器的父控件 */
@property (nonatomic, weak) UIScrollView *scrollView;
/** 所有标题的父控件 */
@property (nonatomic, weak) UIView *titlesView;
/** 标题底部的指示线（下划线） */
@property (nonatomic, weak) UIView *titleUnderlineView;
/** 记录上一次点击的标题按钮 */
@property (nonatomic, weak) UIButton *clickedTitleButton;
/** 存放所有的标题按钮 */
@property (nonatomic, strong) NSMutableArray *titleButtons;

@end

@implementation XYLHomeController

- (NSMutableArray *)titleButtons
{
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setupNav];
    [self setupAllChildVcs];
    [self setupScrollView];
    // 默认显示第0个控制器的view
    [self scrollViewDidEndScrollingAnimation:self.scrollView];
}

- (void)setupNav
{
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:image(@"home_背景")];
    backgroundView.frame = CGRectMake(0, 0, ScreenWeight, ScreenHeight);
    [self.view addSubview:backgroundView];
    // 设置导航栏中间的标题
    UIView *titlesView = [[UIView alloc] init];
    titlesView.width = self.view.width / 2.5;
    titlesView.height = TitlesViewH;
    self.titlesView = titlesView;
    
    // 标题底部的指示线
    UIView *titleUnderlineView = [[UIView alloc] init];
    titleUnderlineView.height = 1;
    titleUnderlineView.y = titlesView.height - titleUnderlineView.height;
    titleUnderlineView.backgroundColor = [UIColor whiteColor];
    [titlesView addSubview:titleUnderlineView];
    self.titleUnderlineView = titleUnderlineView;
    
    // 文字数据
    NSArray *titles = @[@"养生", @"商圈"];
    // 添加所有的标题文字（所有的按钮）
    CGFloat titleW = (titlesView.width - (titles.count - 1)) / titles.count;
    CGFloat titleH = titlesView.height;
    for (int i = 0; i < titles.count; i++) {
        
        // 创建按钮
        XYLTitleButton *titleButton = [XYLTitleButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        [self.titleButtons addObject:titleButton];
        // 设置文字
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        // 设置frame
        titleButton.width = titleW;
        titleButton.height = titleH;
        titleButton.y = 0;
        titleButton.x = i * titleW + i;
        if (i != 0) {
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(titleButton.x - 1, titleH /  3.0f, 1, titleH / 3.0f)];
            lineView.backgroundColor = [UIColor getColor:@"F2F2F2"];
            [self.titlesView addSubview:lineView];
        }
        if (i == 0) {
            // 默认选中第0个按钮
            titleButton.selected = YES;
            self.clickedTitleButton = titleButton;
            // 马上根据文字设置内部label的尺寸
            [titleButton.titleLabel sizeToFit];
            self.titleUnderlineView.width = titleButton.titleLabel.width;
            self.titleUnderlineView.centerX = titleButton.centerX;
        }
    }
    self.navigationItem.titleView = self.titlesView;
}

- (void)setupScrollView
{
    // 不要自动调整scrollView的inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 根据图片名数据创建对应的imageView
    CGFloat w = self.scrollView.frame.size.width;
    CGFloat h = self.scrollView.frame.size.height;
    for (int i = 0; i<self.childViewControllers.count; i++) {
        UIViewController *viewController = self.childViewControllers[i];
        viewController.view.frame = CGRectMake(i * w, 0, w, h);;
        [self.scrollView addSubview:viewController.view];
    }

    // 设置contentSize
    CGFloat contentW = self.childViewControllers.count * self.scrollView.width;
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
}

- (void)setupAllChildVcs
{
    XYLRegimenController *regimenCtr = [[XYLRegimenController alloc] init];
    regimenCtr.title = @"养生";
    [self addChildViewController:regimenCtr];
    
    XYLShopController *shop = [[XYLShopController alloc] init];
    shop.title = @"商圈";
    [self addChildViewController:shop];
}

#pragma mark - 监听
/**
 *  点击了顶部的标题按钮
 */
- (void)titleClick:(XYLTitleButton *)titleButton
{
    // 修改按钮状态
    self.clickedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.clickedTitleButton = titleButton;
    
    // 移除底部下划线
    [UIView animateWithDuration:0.25 animations:^{
        self.titleUnderlineView.width = titleButton.titleLabel.width;
        self.titleUnderlineView.centerX = titleButton.centerX;
    }];
    
    // 让scrollView滚动到对应的位置(不要去修改contentOffset的y值)
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.width;
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark - <UIScrollViewDelegate>
/**
 *  滚动完毕就会调用（如果不是人为拖拽scrollView导致滚动完毕，才会调用这个方法）
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.width;
    UIViewController *willShowChildVc = self.childViewControllers[index];
    
    // 如果这个子控制器的view已经添加过了，就直接返回
    if (willShowChildVc.isViewLoaded) return;
    
    // 添加子控制器的view
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    CGPoint offset = CGPointMake(page * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

/**
 *  滚动完毕就会调用（如果是人为拖拽scrollView导致滚动完毕，才会调用这个方法）
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.width;
    // 点击对应的按钮
    [self titleClick:self.titleButtons[index]];
    // 添加子控制器的view
    [self scrollViewDidEndScrollingAnimation:scrollView];
}


@end
