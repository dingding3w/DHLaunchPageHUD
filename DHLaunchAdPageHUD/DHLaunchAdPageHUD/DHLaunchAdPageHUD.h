//
//  DHLaunchAdPageHUD.h
//  DHLaunchAdPageHUDExample
//
//  Created by Apple on 16/8/16.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DDScreenW [UIScreen mainScreen].bounds.size.width
#define DDScreenH [UIScreen mainScreen].bounds.size.height
typedef void(^DDLaunchAdClickBlock)();

@interface DHLaunchAdPageHUD : UIView
@property (nonatomic, copy) DDLaunchAdClickBlock launchAdClickBlock;/**< 广告点击事件的回调 */

- (instancetype)initWithFrame:(CGRect)frame aDduration:(NSInteger)duration aDImageUrl:(NSString *)imageUrl hideSkipButton:(BOOL)hideSkip launchAdClickBlock:(DDLaunchAdClickBlock)aDClickBlock;
@end
