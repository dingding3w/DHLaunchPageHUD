//
//  DHLaunchDfPageHUD.m
//  DHLaunchDfPageHUDExample
//
//  Created by Apple on 16/8/24.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHLaunchDfPageHUD.h"

@implementation DHLaunchDfPageHUD
static UIImageView *imageView;
- (void)initWithFrame:(CGRect)frame window:(UIWindow *)window image:(UIImage *)image animationStyle:(DDLaunchPageAnimationStyle)style {
    imageView = [[UIImageView alloc] initWithFrame:frame];
    [imageView setImage:image];
    [window.rootViewController.view addSubview:imageView];
    if (!style) {
        [DHAnimationOperation dh_setLaunchPageAnimationStyle:DDLaunchPageAnimationStyleFadeOut window:window imageView:imageView];
    } else {
        [DHAnimationOperation dh_setLaunchPageAnimationStyle:style window:window imageView:imageView];
    }
}
@end
