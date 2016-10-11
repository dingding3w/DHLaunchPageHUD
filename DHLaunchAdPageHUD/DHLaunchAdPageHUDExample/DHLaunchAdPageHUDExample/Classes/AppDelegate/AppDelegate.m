//
//  AppDelegate.m
//  DHLaunchAdPageHUDExample
//
//  Created by Apple on 16/8/16.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "AppDelegate.h"
#import "DHLaunchAdPageHUD.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *adImageJPGUrl = @"http://p5.image.hiapk.com/uploads/allimg/150112/7730-150112143S3.jpg";
    NSString *adimageGIFUrl = @"http://img.ui.cn/data/file/3/4/6/210643.gif";
    NSString *adImageJPGPath = [[NSBundle mainBundle] pathForResource:@"adImage2" ofType:@"jpg"];
    NSString *adImageGifPath = [[NSBundle mainBundle] pathForResource:@"adImage3" ofType:@"gif"];
    
    DHLaunchAdPageHUD *launchAd = [[DHLaunchAdPageHUD alloc] initWithFrame:CGRectMake(0, 0, DDScreenW, DDScreenH-100) aDduration:6.0 aDImageUrl:adImageGifPath hideSkipButton:NO launchAdClickBlock:^{
        NSLog(@"[AppDelegate]:点了广告图片");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
