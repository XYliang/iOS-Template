//
//  XYLGuidanceController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/18.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLGuidanceController.h"
#import "XYLInfiniteScrollView.h"
#import "XYLFileterView.h"
#import "MJExtension.h"
#import "XYLDoctorCell.h"
#import "XYLDoctorObject.h"
#import "XYLChatController.h"

#define HeadHeight 180
@interface XYLGuidanceController()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate,XYLFileterViewDelegate>
{
    UIView *_maskView;
    NSInteger _KindID;  //分类查询ID，默认-1
    NSArray *_doctorArray;
    NSInteger _offset;
}


@property (nonatomic ,strong)UITableView *guidanceTableView;
/**选择按钮数组*/
@property (nonatomic, strong) NSArray *filterName;
@property (nonatomic, weak) UIButton *filterBtn;
@property (nonatomic, weak) UIButton *triangleBtn;

@end

@implementation XYLGuidanceController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:[self headerView]];
    [self initView];
    [self initMaskView];
    [self initData];
    
    //set up doctordata
//    BmobObject  *gameScore = [BmobObject objectWithClassName:@"doctorKinds"];
    //设置playerName列的值为小黑和age列的值18
//    NSDictionary *dic = @{
//                          @"name":@"骨科",
//                          @"id":@0,
//                          @"list":@[
//                                  @{
//                                      @"name":@"坐骨",
//                                      @"id":@01
//                                      },
//                                  @{
//                                      @"name":@"膝盖骨",
//                                      @"id":@02
//                                      },
//                                  @{
//                                      @"name":@"头骨",
//                                      @"id":@03
//                                      },
//                                  @{
//                                      @"name":@"腰椎骨",
//                                      @"id":@04
//                                      },
//                                  @{
//                                      @"name":@"肩胛骨",
//                                      @"id":@05
//                                      },
//                                  @{
//                                      @"name":@"手足骨",
//                                      @"id":@06
//                                      }
//                              ]
//                         
//                          };
//    [gameScore saveAllWithDictionary:dic];
//    //异步保存
//    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
//        if (isSuccessful) {
//            //创建成功后的动作
//        } else if (error){
//            //发生错误后的动作
//            NSLog(@"%@",error);
//        } else {
//            NSLog(@"Unknow error");
//        }
//    }];
}

-(void)initData{
    _offset = 0;
    _KindID = -1;//默认-1
    _doctorArray = [NSMutableArray array];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self loadDoctorData];
}

-(UIView *)headerView
{
    XYLInfiniteScrollView *scrollView = [[XYLInfiniteScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, ScreenWeight, HeadHeight);
    scrollView.images = @[
                          [UIImage imageNamed:@"yisheng1.jpg"],
                          [UIImage imageNamed:@"yisheng2.jpg"],
                          [UIImage imageNamed:@"yisheng3.jpg"],
                          [UIImage imageNamed:@"yisheng4.jpg"],
                          [UIImage imageNamed:@"yisheng5.jpg"]
                          ];
    scrollView.pageControl.currentPageIndicatorTintColor = [UIColor clearColor];
    scrollView.pageControl.pageIndicatorTintColor = [UIColor clearColor];
    scrollView.scrollDirectionPortrait = NO;
    return scrollView;
}

-(void)initView{
    
    //筛选
    UIView *filterView = [[UIView alloc] initWithFrame:CGRectMake(0, HeadHeight, ScreenWeight, 40)];
    filterView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:filterView];
    
    NSArray *filterName = @[@"医生分类"];
    self.filterName = filterName;
    //筛选
    for (int i = 0; i < filterName.count; i++) {
        //文字
        CGSize titleSize = [filterName[i] sizeWithFont:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
        UIButton *filterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        filterBtn.frame = CGRectMake(2*MaxMargin, 0, titleSize.width, 40);
        filterBtn.tag = 100+i;
        filterBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [filterBtn setTitle:filterName[i] forState:UIControlStateNormal];
        [filterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [filterBtn setTitleColor:[UIColor getColor:@"00CC99"] forState:UIControlStateSelected];
        filterBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [filterBtn addTarget:self action:@selector(OnFilterBtn:) forControlEvents:UIControlEventTouchUpInside];
        [filterView addSubview:filterBtn];
        self.filterBtn = filterBtn;
        
        //三角
        UIButton *triangleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        triangleBtn.frame = CGRectMake(CGRectGetMaxX(filterBtn.frame)+SmallMargin, 16, 8, 7);
        triangleBtn.tag = 120+i;
        [triangleBtn setImage:[UIImage imageNamed:@"icon_arrow_dropdown_normal"] forState:UIControlStateNormal];
        [triangleBtn setImage:[UIImage imageNamed:@"icon_arrow_dropdown_selected"] forState:UIControlStateSelected];
        [filterView addSubview:triangleBtn];
        self.triangleBtn = triangleBtn;
    }
    //下划线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5+HeadHeight, ScreenWeight, 0.5)];
    lineView.backgroundColor = Color(192, 192, 192);
    [filterView addSubview:lineView];
    
    UITableView *tableView = [UITableView initWithTableView:CGRectMake(0, 40+HeadHeight, ScreenWeight, ScreenHeight-64 - HeadHeight) withDelegate:self];
    self.guidanceTableView = tableView;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, self.tabBarController.tabBar.frame.size.height + 44, 0);
    self.guidanceTableView.contentInset = insets;
    self.guidanceTableView.backgroundColor = [UIColor getColor:@"F2F2F2"];
    self.guidanceTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.guidanceTableView];
    
}

//显示选择框
-(void)OnFilterBtn:(UIButton *)sender{

    for (int i = 0; i < self.filterName.count; i++) {
        UIButton *menubtn = (UIButton *)[self.view viewWithTag:100+i];
        UIButton *arrowBtn = (UIButton *)[self.view viewWithTag:120+i];
        menubtn.selected = NO;
        arrowBtn.selected = NO;
    }
    sender.selected = YES;
    UIButton *sjBtn = (UIButton *)[self.view viewWithTag:sender.tag+20];
    sjBtn.selected = YES;
    _maskView.hidden = NO;       
    
}

-(void)OnTapMaskView:(UITapGestureRecognizer *)sender
{
    _maskView.hidden = YES;
    [self setupButtonStatus];
}

-(void)setupButtonStatus
{
    self.triangleBtn.selected = NO;
    self.filterBtn.selected = NO;
}
#pragma mark - 初始化遮罩层视图 后续封装起来。
-(void)initMaskView
{
    _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 40+HeadHeight, ScreenWeight, ScreenHeight-150-HeadHeight)];
    _maskView.backgroundColor = ColorA(0, 0, 0, 0.5);
    [self.view addSubview:_maskView];
    _maskView.hidden = YES;
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapMaskView:)];
    tap.delegate = self;
    [_maskView addGestureRecognizer:tap];
    
    XYLFileterView *filterView =  [[XYLFileterView alloc]initWithFrame:CGRectMake(0, 0, ScreenWeight, ScreenHeight- 300-HeadHeight)];
    filterView.delegate = self;
    [_maskView addSubview:filterView];
}

//手势代理
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UITableView class]] || [touch.view.superview isKindOfClass:[UITableView class]] || [touch.view.superview.superview isKindOfClass:[UITableView class]] || [touch.view.superview.superview.superview isKindOfClass:[UITableView class]])  {
        return NO;
    }
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _doctorArray.count;;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYLDoctorCell *cell = [XYLDoctorCell cellWithTableView:tableView];
    cell.doctorObject = _doctorArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat
{
    return  160;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XYLChatController *chatController = [[XYLChatController alloc]init];
    [self.navigationController pushViewController:chatController animated:YES];
}

# pragma mark -XYLFilterView代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath withId:(NSNumber *)ID
{
    [self setupButtonStatus];
    _KindID = [ID integerValue];
    _maskView.hidden = YES;
    [self loadDoctorData];
}

#pragma mark - 请求所有医生数据
-(void)loadDoctorData{
    NSArray *doctorDataArray = plistArray(@"Doctor");
    NSArray *doctorObjectArray = [XYLDoctorObject mj_objectArrayWithKeyValuesArray:doctorDataArray];
    _doctorArray = doctorObjectArray;
    [self.guidanceTableView reloadData];
}

@end
