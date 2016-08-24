//
//  DHLaunchDfPageHUD.h
//  DHLaunchDfPageHUDExample
//
//  Created by Apple on 16/8/24.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DHAnimationOperation.h"

@interface DHLaunchDfPageHUD : NSObject
/**
 *  自定义启动页创建
 *
 *  @param frame  位置大小
 *  @param window 主窗口
 *  @param image  启动图片
 *  @param style  启动样式
 */
- (void)initWithFrame:(CGRect)frame window:(UIWindow *)window image:(UIImage *)image animationStyle:(DDLaunchPageAnimationStyle)style;
@end
