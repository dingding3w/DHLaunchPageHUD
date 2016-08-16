//
//  DHAnimationOperation.h
//  DHLaunchPageHUDExample
//
//  Created by Apple on 16/8/16.
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

@interface DHAnimationOperation : NSObject
+ (void)dh_setLaunchPageAnimationStyle:(DDLaunchPageAnimationStyle)animationStyle window:(UIWindow *)window imageView:(UIImageView *)imageView;
@end
