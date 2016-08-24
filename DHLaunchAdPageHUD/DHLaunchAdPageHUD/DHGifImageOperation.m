//
//  DHGifImageOperation.m
//  DHLaunchAdPageHUDExample
//
//  Created by Apple on 16/8/16.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHGifImageOperation.h"
#import <ImageIO/ImageIO.h>
#import <QuartzCore/QuartzCore.h>

@interface DHGifImageOperation ()
{
    CGImageSourceRef gif;
    NSDictionary *gifProperties;
    size_t index;
    size_t count;
    NSTimer *timer;
}
@end

@implementation DHGifImageOperation
- (id)initWithFrame:(CGRect)frame gifImagePath:(NSString *)gifImagePath {
    self = [super initWithFrame:frame];
    if (self) {
        gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount] forKey:(NSString *)kCGImagePropertyGIFDictionary];
        gif = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:gifImagePath], (CFDictionaryRef)gifProperties);
        count =CGImageSourceGetCount(gif);
        timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(play) userInfo:nil repeats:YES];/**< 0.12->0.06 */
        [timer fire];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame gifImageData:(NSData *)gifImageData {
    self = [super initWithFrame:frame];
    if (self) {
        gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount] forKey:(NSString *)kCGImagePropertyGIFDictionary];
        gif = CGImageSourceCreateWithData((CFDataRef)gifImageData, (CFDictionaryRef)gifProperties);
        count =CGImageSourceGetCount(gif);
        timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(play) userInfo:nil repeats:YES];/**< 0.12->0.06 */
        [timer fire];
    }
    return self;
}

- (void)play {
    if (count > 0) {
        index ++;
        index = index%count;
        CGImageRef ref = CGImageSourceCreateImageAtIndex(gif, index, (CFDictionaryRef)gifProperties);
        self.layer.contents = (__bridge id)ref;
        CFRelease(ref);
    } else {
        static dispatch_once_t onceToken;
        //只执行一次
        dispatch_once(&onceToken, ^{
            NSLog(@"请检测网络或者http协议");
        });
    }
}

- (void)removeFromSuperview {
    NSLog(@"removeFromSuperview");
    [timer invalidate];
    timer = nil;
    [super removeFromSuperview];
}

#pragma mark - 加载本地GIF图片无需设置NSTimer
/**< 使用案例: [self.XXX addSubview:[[DHGifImageOperation alloc] initWithFrame:self.adFrame gifImageName:@"XXX.gif"]]; */
- (id)initWithFrame:(CGRect)frame gifImageName:(NSString *)gifImageName {
    self = [super initWithFrame:frame];
    if (self) {
        NSString *gifImgName = [gifImageName stringByReplacingOccurrencesOfString:@".gif" withString:@""];
        NSData *gifData      = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:gifImgName ofType:@"gif"]];
        UIWebView *webView   = [[UIWebView alloc] initWithFrame:frame];
        [webView setBackgroundColor:[UIColor clearColor]];
        [webView setScalesPageToFit:YES];
        [webView.scrollView setScrollEnabled:NO];
        [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:@"" baseURL:[NSURL URLWithString:@""]];
        
        UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [clearButton setFrame:webView.frame];
        [clearButton setBackgroundColor:[UIColor clearColor]];
        [clearButton addTarget:self action:@selector(activiTap:) forControlEvents:UIControlEventTouchUpInside];
        [webView addSubview:clearButton];
        [self addSubview:webView];
    }
    return self;
}

- (void)activiTap:(UITapGestureRecognizer*)recognizer{
    NSLog(@"activiTap:recognizer");
}
@end
