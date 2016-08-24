//
//  DHAnimationOperation.m
//  DHLaunchPageHUDExample
//
//  Created by Apple on 16/8/16.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHAnimationOperation.h"
#import "CALayer+DHExtension.h"

#define DDAnimationDelayTime    2.0 // 动画延迟时间
#define DDAnimationDuration     2.0 // 动画执行时间

@implementation DHAnimationOperation
+ (void)dh_setLaunchPageAnimationStyle:(DDLaunchPageAnimationStyle)animationStyle window:(UIWindow *)window imageView:(UIImageView *)imageView{
    switch (animationStyle) {
        case DDLaunchPageAnimationStyleFadeOut: {/**< 淡出 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:DDAnimationDuration animations:^{
                    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                    [imageView setTransform:CGAffineTransformMakeScale(2.0, 2.0)];
                    [imageView setAlpha:0.0];
                } completion:^(BOOL finished) {
                    [imageView removeFromSuperview];
                }];
            });
        }
            break;
            
        case DDLaunchPageAnimationStyleFadeIn: {/**< 淡入 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:DDAnimationDuration animations:^{
                    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                    [imageView setTransform:CGAffineTransformMakeScale(0.1, 0.1)];
                    [imageView setAlpha:0.0];
                } completion:^(BOOL finished) {
                    [imageView removeFromSuperview];
                }];
            });
        }
            break;
            
        case DDLaunchPageAnimationStyleToppleOver: {/**< 倾倒 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [imageView.layer dh_launchPageAnimationStyleToppleOver:imageView.layer duration:DDAnimationDuration];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [imageView removeFromSuperview];
                });
            });
        }
            break;
            
        case DDLaunchPageAnimationStyleWaterWave: {/**< 水波 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [imageView removeFromSuperview];
                [window.layer dh_transitionWithAnimationType:DDTransitionAnimationTypeWaterWave subType:DDTransitionSubTypesFromRamdom curve:DDTransitionCurveRamdom duration:DDAnimationDuration];
            });
        }
            break;
            
        case DDLaunchPageAnimationStyleSuckEffect: {/**< 吸走 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [imageView removeFromSuperview];
                [window.layer dh_transitionWithAnimationType:DDTransitionAnimationTypeSuckEffect subType:DDTransitionSubTypesFromRamdom curve:DDTransitionCurveRamdom duration:DDAnimationDuration];
            });
        }
            break;
            
        case DDLaunchPageAnimationStyleOglFlip: {/**< 翻转 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [imageView removeFromSuperview];
                [window.layer dh_transitionWithAnimationType:DDTransitionAnimationTypeOglFlip subType:DDTransitionSubTypesFromRamdom curve:DDTransitionCurveRamdom duration:DDAnimationDuration];
            });
        }
            break;
            
        case DDLaunchPageAnimationStyleCube: {/**< 立方体 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [imageView.layer dh_transitionWithAnimationType:DDTransitionAnimationTypeCube subType:DDTransitionSubTypesFromRamdom curve:DDTransitionCurveRamdom duration:DDAnimationDuration];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:1.0 animations:^{
                        [imageView setAlpha:0.0];
                    } completion:^(BOOL finished) {
                        [imageView removeFromSuperview];
                    }];
                });
            });
        }
            break;
            
        case DDLaunchPageAnimationStyleReveal: {/**< 推开 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [imageView removeFromSuperview];
                [window.layer dh_transitionWithAnimationType:DDTransitionAnimationTypeReveal subType:DDTransitionSubTypesFromRamdom curve:DDTransitionCurveRamdom duration:DDAnimationDuration];
            });
        }
            break;
            
        case DDLaunchPageAnimationStylePageCurl: {/**< 翻书 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [imageView removeFromSuperview];
                [window.layer dh_transitionWithAnimationType:DDTransitionAnimationTypePageCurl subType:DDTransitionSubTypesFromRamdom curve:DDTransitionCurveRamdom duration:DDAnimationDuration];
            });
        }
            break;
            
        case DDLaunchPageAnimationStylePageUnCurl: {/**< 合书 */
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDAnimationDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [imageView removeFromSuperview];
                [window.layer dh_transitionWithAnimationType:DDTransitionAnimationTypePageUnCurl subType:DDTransitionSubTypesFromRamdom curve:DDTransitionCurveRamdom duration:DDAnimationDuration];
            });
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 移除视图
//+ (void)dh_removeLaunchPageHUD {
//    [UIView animateWithDuration:1.0 animations:^{
//        [imageView setAlpha:0.0];
//    } completion:^(BOOL finished) {
//        [imageView removeFromSuperview];
//    }];
//}
@end
