//
//  CALayer+DHExtension.m
//  LaunchPage
//
//  Created by Apple on 16/7/26.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "CALayer+DHExtension.h"

@implementation CALayer (DHExtension)
- (CATransition *)dh_transitionWithAnimationType:(DDTransitionAnimationType)animationType subType:(DDTransitionSubType)subType curve:(DDTransitionCurve)curve duration:(CGFloat)duration {
    NSString *key = @"transition";
    
    if([self animationForKey:key]!=nil){
        [self removeAnimationForKey:key];
    }
    
    CATransition *transition=[CATransition animation];
    // 动画时长
    transition.duration=duration;
    // 动画类型
    transition.type=[self animaTypeWithTransitionType:animationType];
    // 动画方向
    transition.subtype=[self animaSubtype:subType];
    // 缓动函数
    transition.timingFunction=[CAMediaTimingFunction functionWithName:[self curve:curve]];
    // 完成动画删除
    transition.removedOnCompletion = YES;
    [self addAnimation:transition forKey:key];
    return transition;
}

#pragma mark - 返回动画曲线
- (NSString *)curve:(DDTransitionCurve)curve {
    // 曲线数组
    NSArray *funcNames=@[kCAMediaTimingFunctionDefault,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionLinear];
    
    return [self objFromArray:funcNames index:curve isRamdom:(DDTransitionCurveRamdom == curve)];
}

#pragma mark - 返回动画方向
- (NSString *)animaSubtype:(DDTransitionSubType)subType {
    // 设置转场动画的方向
    NSArray *subtypes=@[kCATransitionFromTop,kCATransitionFromLeft,kCATransitionFromBottom,kCATransitionFromRight];
    
    return [self objFromArray:subtypes index:subType isRamdom:(DDTransitionSubTypesFromRamdom == subType)];
}

#pragma mark - 返回动画类型
- (NSString *)animaTypeWithTransitionType:(DDTransitionAnimationType)type {
    // 设置转场动画的类型
    NSArray *animArray=@[@"rippleEffect",@"suckEffect",@"pageCurl",@"oglFlip",@"cube",@"reveal",@"pageUnCurl",@"push"];
    
    return [self objFromArray:animArray index:type isRamdom:(DDTransitionAnimationTypeRamdom == type)];
}

#pragma mark - 统一从数据返回对象
- (id)objFromArray:(NSArray *)array index:(NSUInteger)index isRamdom:(BOOL)isRamdom {
    NSUInteger count = array.count;
    NSUInteger i = isRamdom?arc4random_uniform((u_int32_t)count) : index;
    return array[i];
}

#pragma mark - DDLaunchPageAnimationStyleToppleOver 倾倒效果方法抽取
- (void)dh_launchPageAnimationStyleToppleOver:(CALayer *)layer duration:(CGFloat)duration{
    // 创建普通动画
    CABasicAnimation *rotationAnim = [CABasicAnimation animationWithKeyPath:[NSString stringWithFormat:@"transform.rotation.z"]];
    // 动画曲线
    rotationAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    // 起点值
    rotationAnim.fromValue=@(0);
    // 终点值
    rotationAnim.toValue = @(M_PI_2);
    // 时长
    rotationAnim.duration = duration;
    // 自动反转
    rotationAnim.autoreverses = NO;
    // 完成删除
    rotationAnim.removedOnCompletion = YES;
    // 重复次数
    rotationAnim.repeatCount = 0;
    // 向前填充
    rotationAnim.fillMode=kCAFillModeForwards;
    // 动画完成不删除
    rotationAnim.removedOnCompletion = NO;
    // 锚点
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position=CGPointMake(0, layer.bounds.size.height);
    // 添加
    [layer addAnimation:rotationAnim forKey:@"rotationAnim"];
}

@end
