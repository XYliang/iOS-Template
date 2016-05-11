//
//  XYLTransitionObject.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/30.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#define itemsCount 3 //底部按钮的数量
#import "XYLTransitionObject.h"


@interface XYLTransitionObject()

@end
@implementation XYLTransitionObject

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 由context获得参与过渡的各个角色
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 可以把containerView理解成一个舞台，参与过渡动画的角色在这个舞台上表演，所以要让他们上台先
    [[transitionContext containerView] addSubview:fromView];
    [[transitionContext containerView] addSubview:toView];

    // 找出各个VC在tabBar上的位置。
//    NSUInteger fromViewControllerIndex = [self.tabBarController.viewControllers indexOfObject:fromViewController];
    NSUInteger toViewControllerIndex = [self.tabBarController.viewControllers indexOfObject:toViewController];
    
    // 计算出点击的tab的位置，作为动画的圆心
    CGRect tabBarFrame = _tabBarController.tabBar.frame;
    NSUInteger tabBarItemCount = itemsCount;
    CGFloat tabBarItemWidth = tabBarFrame.size.width / (CGFloat)tabBarItemCount;
    CGFloat tappedItemY = tabBarFrame.origin.y;
    CGFloat tappedItemX = tabBarItemWidth * ((CGFloat)toViewControllerIndex + 0.5);
    
    // 圆要放大到的半径，勾股定理算出toView的对角线长度
    CGFloat finalRadius = sqrt(pow(toView.frame.size.height, 2) + pow(toView.frame.size.width, 2));
    
    // 构造开始时和结束时的圆的贝赛尔曲线。
    CGPathRef start = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(tappedItemX, tappedItemY, 0, 0)].CGPath;
    CGPathRef final = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(tappedItemX - finalRadius, tappedItemY - finalRadius, finalRadius * 2, finalRadius * 2)].CGPath;
    
    // 新建一个CAShapeLayer，用作toView的遮罩。并且开始时的path设置为上面的start——位置在点击的tab上的一个半径为0的圆。
    // 下文中就要给这个path加特技，让他变化到包含整个界面那么大。
    CAShapeLayer *circleMask = [[CAShapeLayer alloc] init];
    circleMask.path = start;
    toView.layer.mask = circleMask;
    
    // 给circleMask的path属性加动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(start);
    animation.toValue = (__bridge id _Nullable)(final);
    animation.duration = [self transitionDuration:transitionContext];
    animation.delegate = self;                                                                 // 设置CABasicAnimation的delegate为self，好在动画结束后通知系统过渡完成了。
    [animation setValue:transitionContext forKey:@"transitionContext"];// 待会需要用到transitionContext的completeTransition方法'
    [circleMask addAnimation:animation forKey:@"circleAnimation"];
    circleMask.path = final;
}

// 过渡动画完成后，调用completeTransition说明过渡完成。
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    id context = [anim valueForKey:@"transitionContext"];
    [context completeTransition:YES];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

@end
