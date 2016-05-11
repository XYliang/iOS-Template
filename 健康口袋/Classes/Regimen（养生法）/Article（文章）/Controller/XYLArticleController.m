//
//  XYLArticleController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/3.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLArticleController.h"
#import "XYLArticleHeadView.h"
#import "XYLArticleBottomView.h"
#import "XYLTopTextView.h"
#import "XYLTextObject.h"
#import "XYLTextObjectFrame.h"
#import "XYLTextCell.h"

#define BottomHeight 50
#define HeadHeight  100
#define statusBarHeight [[UIApplication sharedApplication]statusBarFrame].size.height
@interface XYLArticleController ()<UITableViewDelegate,UITableViewDataSource>
@property(weak, nonatomic)UITableView *articleTableView;
@property(strong, nonatomic)NSArray *dataArray;
@property(weak, nonatomic)XYLArticleBottomView * bottom;
@property(assign,nonatomic) CGFloat topTextHeight;
@property(weak, nonatomic)XYLArticleHeadView *head;
@property(assign,nonatomic) CGFloat prefixOffset;
@end

@implementation XYLArticleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableview];
    [self setHeadView];
    [self setBottomView];
    [self setGesture];
}

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        NSArray *array = plistArray(@"Text");
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            XYLTextObject *textObejct = [XYLTextObject textObjectWithDictionary:dict];
            XYLTextObjectFrame *textObjectFrame = [[XYLTextObjectFrame alloc]init];
            textObjectFrame.textObject = textObejct;
            [mutableArray addObject:textObjectFrame];
        }
        _dataArray = [mutableArray copy];
    }
    return _dataArray;
}


-(void)setTableview
{
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWeight, ScreenHeight - BottomHeight)];
    self.articleTableView = tableview;
    self.articleTableView.delegate = self;
    self.articleTableView.dataSource = self;
    tableview.allowsSelection = NO;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.contentInset = UIEdgeInsetsMake(HeadHeight, 0, 10, 0);
    [self.view addSubview:self.articleTableView];
    
    XYLTopTextView *topTextView = xibView(@"XYLTopTextView");
    NSString *string = [NSString stringWithFormat:@"%@%@",@"健身运动是指通过徒手或利用各种器械，运用专门科学的动作方式和方法进行锻炼，以发达肌肉、增长体力、改善形体和陶冶情操为目的的运动项目。它还可以改善人体健康水平，提高心肺功能，帮助术后恢复等。具体项目有很多，常见的如游泳、跑步、体操、举重等",@"&#12288&#12288"];
    topTextView.topTextView.text = string;
    UIFont *font = [UIFont systemFontOfSize:19];
    CGSize size = [topTextView.topTextView.text sizeWithFont:font maxSize:CGSizeMake(ScreenWeight - 2 * MaxMargin, 300)];
    self.topTextHeight = size.height + 2*MaxMargin;
    topTextView.frame = CGRectMake(0, HeadHeight, ScreenWeight, self.topTextHeight);
    self.articleTableView.tableHeaderView = topTextView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y + HeadHeight;
    if (offsetY > (self.topTextHeight) && offsetY < (self.topTextHeight+HeadHeight)) {
        
        self.head.y = -offsetY+self.topTextHeight;
    }
    if (offsetY > (self.topTextHeight+HeadHeight)) {
        self.head.y = -(self.topTextHeight+HeadHeight);
    }
    if (offsetY < (self.topTextHeight)) {
        self.head.y = 0;
    }

}

-(void)setHeadView
{
    XYLArticleHeadView *head = xibView(@"XYLArticleHeadView");
    head.frame = CGRectMake(0, 0, ScreenWeight, 100);
    head.titleImageView.image = [UIImage imageNamed:self.titleImageStr];
    head.titleLabel.text = self.titleStr;
    self.head= head;
    [self.view addSubview:head];
}

-(void)setBottomView
{
    XYLArticleBottomView * bottom = xibView(@"XYLArticleBottomView");
    bottom.frame = CGRectMake(0, ScreenHeight - BottomHeight, ScreenWeight, BottomHeight);
    self.bottom = bottom;
    [bottom.backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:bottom atIndex:2];

}

-(void)setGesture
{
    //添加滑动手势
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(backClick)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGestureRecognizer];
}

#pragma mark- bottomButtonClicked
-(void)backClick
{
    [self dismissViewControllerAnimated:YES completion:^{
        self.view=nil;
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYLTextCell *cell = [XYLTextCell cellWithTableView:tableView cellForItemAtIndexPath:indexPath];
    cell.textObjectFrame = self.dataArray[indexPath.row];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYLTextObjectFrame *frame = self.dataArray[indexPath.row];

    return frame.cellHeight;
}

@end
