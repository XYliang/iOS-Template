//
//  XYLGuidanceGroupObject.h
//  健康口袋
//
//  Created by 薛银亮 on 16/2/28.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYLGuidanceGroupObject : NSObject

@property(nonatomic, strong) NSNumber *id;
//@property(nonatomic, strong) NSNumber *index;
//@property(nonatomic, strong) NSNumber *parentID;
//@property(nonatomic, strong) NSNumber *count;
@property(nonatomic, strong) NSString *name;


@property(nonatomic, strong) NSMutableArray *list;
@end
