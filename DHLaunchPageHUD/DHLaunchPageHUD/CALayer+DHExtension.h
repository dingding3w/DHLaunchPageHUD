//
//  CALayer+DHExtension.h
//  LaunchPage
//
//  Created by Apple on 16/7/26.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (DHExtension)
#pragma mark - 动画类型
typedef enum {
    DDTransitionAnimationTypeWaterWave = 0,      /**< 水波 - 动画类型 */
    DDTransitionAnimationTypeSuckEffect,         /**< 吸走 - 动画类型 */
    DDTransitionAnimationTypeOglFlip,            /**< 翻转 - 动画类型 */
    DDTransitionAnimationTypeCube,               /**< 立方体 - 动画类型 */
    DDTransitionAnimationTypeReveal,             /**< 推开 - 动画类型 */
    DDTransitionAnimationTypePageCurl,           /**< 翻书 - 动画类型 */
    DDTransitionAnimationTypePageUnCurl,         /**< 合书 - 动画类型 */
    DDTransitionAnimationTypeRamdom,             /**< 随机 - 动画类型 */
}DDTransitionAnimationType;

#pragma mark - 动画效果
typedef enum {
    DDTransitionSubTypesFromTop = 0,  /**< 上 - 动画效果 */
    DDTransitionSubTypesFromLeft,     /**< 左 - 动画效果 */
    DDTransitionSubTypesFromBotoom,   /**< 下 - 动画效果 */
    DDTransitionSubTypesFromRight,    /**< 右 - 动画效果 */
    DDTransitionSubTypesFromRamdom,   /**< 随机 - 动画效果 */
}DDTransitionSubType;

#pragma mark - 动画曲线
typedef enum {
    DDTransitionCurveDefault,       /**< 默认 - 动画曲线 */
    DDTransitionCurveLinear,        /**< 线行 - 动画曲线 */
    DDTransitionCurveEaseIn,        /**< 缓进 - 动画曲线 */
    DDTransitionCurveEaseOut,       /**< 缓出 - 动画曲线 */
    DDTransitionCurveEaseInEaseOut, /**< 缓进缓出 - 动画曲线 */
    DDTransitionCurveRamdom,        /**< 随机 - 动画曲线 */
}DDTransitionCurve;

/**
 *  自定义转场动画
 *
 *  @param animationType 转场动画类型
 *  @param subType       转动动画方向
 *  @param curve         转动动画曲线
 *  @param duration      转动动画时长
 *
 *  @return 自定义转场动画实例
 */
- (CATransition *)dh_transitionWithAnimationType:(DDTransitionAnimationType)animationType subType:(DDTransitionSubType)subType curve:(DDTransitionCurve)curve duration:(CGFloat)duration;

- (void)dh_launchPageAnimationStyleToppleOver:(CALayer *)layer duration:(CGFloat)duration;
@end
