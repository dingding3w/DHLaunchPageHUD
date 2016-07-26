//
//  DHLaunchPageHUD.h
//  LaunchPage
//
//  Created by Apple on 16/7/25.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, DDLaunchPageAnimationStyle) {
    DDLaunchPageAnimationStyleFadeOut = 0,      /**< 淡出 */
    DDLaunchPageAnimationStyleFadeIn,           /**< 淡入 */
    DDLaunchPageAnimationStyleClip,             /**< 从中间剪开(未实现) */
    DDLaunchPageAnimationStyleToppleOver,       /**< 倾倒 */
    DDLaunchPageAnimationStyleWaterWave,        /**< 水波 */
    DDLaunchPageAnimationStyleSuckEffect,       /**< 吸走 */
    DDLaunchPageAnimationStyleOglFlip,          /**< 翻转 */
    DDLaunchPageAnimationStyleCube,             /**< 立方体 */
    DDLaunchPageAnimationStyleReveal,           /**< 推开 */
    DDLaunchPageAnimationStylePageCurl,         /**< 翻书 */
    DDLaunchPageAnimationStylePageUnCurl,       /**< 合书 */
};

@interface DHLaunchPageHUD : NSObject
/**
 *  自定义启动页创建
 *
 *  @param frame  位置大小
 *  @param window 主窗口
 *  @param image  启动图片
 *  @param style  启动样式
 */
+ (void)dh_initWithFrame:(CGRect)frame window:(UIWindow *)window image:(UIImage *)image animationStyle:(DDLaunchPageAnimationStyle)style;
@end
