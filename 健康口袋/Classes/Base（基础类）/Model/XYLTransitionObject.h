//
//  XYLTransitionObject.h
//  健康口袋
//
//  Created by 薛银亮 on 16/3/30.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYLTabBarController.h"

@interface XYLTransitionObject : NSObject<UIViewControllerAnimatedTransitioning>

@property(strong, nonatomic)XYLTabBarController *tabBarController;

@end
