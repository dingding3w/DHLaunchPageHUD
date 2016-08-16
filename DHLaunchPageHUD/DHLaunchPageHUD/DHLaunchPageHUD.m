//
//  DHLaunchPageHUD.m
//  LaunchPage
//
//  Created by Apple on 16/7/26.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHLaunchPageHUD.h"

@implementation DHLaunchPageHUD
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
