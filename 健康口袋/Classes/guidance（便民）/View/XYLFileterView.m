//
//  XYLFileterView.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/27.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLFileterView.h"
#import "XYLGuidanceGroupObject.h"
#import "MJExtension.h"
#import "XYLKindFilterCell.h"
#import "XYLKindSubclassFilterCell.h"

#define TableViewW self.frame.size.width
#define TableViewH self.frame.size.height

@interface XYLFileterView()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_bigGroupArray;//左边分组tableview的数据源
    NSMutableArray *_smallGroupArray;//右边分组tableview的数据源
    
    NSInteger _bigSelectedIndex;
    NSInteger _smallSelectedIndex;
}
@end

@implementation XYLFileterView

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        _bigGroupArray = [[NSMutableArray alloc] init];
        _smallGroupArray = [[NSMutableArray alloc] init];
        
        [self initViews];
        [self getBigListData];
    }
    return self;
}

-(void)initViews{
    
    for (int i = 0 ; i < 2; i ++) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(i *TableViewW/2,  0, TableViewW/2, TableViewH) style:UITableViewStylePlain];
        tableView.tag = 11 + i ;
        tableView.delegate = self;
        tableView.dataSource = self;
        if (i == 0 ) {
            self.tableViewOfGroup =tableView;
            self.tableViewOfGroup.backgroundColor = [UIColor whiteColor];
            
        }else{
            self.tableViewOfDetail =tableView;
            self.tableViewOfDetail.backgroundColor = Color(242, 242, 242);
            
        }
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:tableView];
    }
}

-(void)getBigListData
{
//    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"doctorKinds"];
//    //查找GameScore表的数据
//    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
//        NSMutableArray *objectArray = [NSMutableArray arrayWithCapacity:array.count];
//        for (BmobObject *obj in array) {
////            XYLGuidanceGroupObject *buttonObject = [XYLGuidanceGroupObject mj_objectWithKeyValues:obj];
////            [objectArray addObject:buttonObject];
//            NSLog(@"%@",[obj objectForKey:@"list"]);
//        }
//        _bigGroupArray = [array copy];
//        [self.tableViewOfGroup reloadData];
//    }];
    NSArray *dataArray = plistArray(@"GuidanceGroup");
    NSMutableArray *objectArray = [NSMutableArray arrayWithCapacity:dataArray.count];
    for (int i = 0; i < dataArray.count; i++) {
        XYLGuidanceGroupObject *buttonObject = [XYLGuidanceGroupObject mj_objectWithKeyValues:dataArray[i]];
        [objectArray addObject:buttonObject];
    }
    _bigGroupArray = [objectArray copy];
    [self.tableViewOfGroup reloadData];
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 11) {
        return _bigGroupArray.count;
    }else{
        if (_bigGroupArray.count == 0) {
            return 0;
        }
        XYLGuidanceGroupObject *subclassCateM = (XYLGuidanceGroupObject *)_bigGroupArray[_bigSelectedIndex];
        if (subclassCateM.list == nil) {
            return 0;
        }else{
            return subclassCateM.list.count;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 42;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 11) {
        XYLKindFilterCell *cell = [XYLKindFilterCell cellWithTableView:tableView];
        cell.guidanceGroupObject = _bigGroupArray[indexPath.row];
        return cell;
    }else{
        XYLGuidanceGroupObject *cateModel = (XYLGuidanceGroupObject *)_bigGroupArray[_bigSelectedIndex];
        XYLKindSubclassFilterCell *cell = [XYLKindSubclassFilterCell cellWithTableView:tableView indexPath:indexPath model:cateModel];
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 11) {
        _bigSelectedIndex = indexPath.row;
        XYLGuidanceGroupObject *cataModel =  _bigGroupArray[_bigSelectedIndex];
        [self.tableViewOfDetail reloadData];
        if (cataModel.list == nil) {
            [self.tableViewOfDetail reloadData];
            [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath withId:cataModel.id];
        }else{
            [self.tableViewOfDetail reloadData];
        }
    }else{
        _smallSelectedIndex = indexPath.row;
        XYLGuidanceGroupObject *cataModel =  _bigGroupArray[_bigSelectedIndex];
        NSDictionary *dict =  cataModel.list[_smallSelectedIndex];
        NSNumber *ID = [dict objectForKey:@"id"];
         if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:withId:)])
         {
             [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath withId:ID ];
        }
    }

}

@end
