//
//  DHLaunchAdPageHUD.m
//  DHLaunchAdPageHUDExample
//
//  Created by Apple on 16/8/16.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHLaunchAdPageHUD.h"
#import "DHRegularExpression.h"
#import "DHGifImageOperation.h"

@interface DHLaunchAdPageHUD ()
@property (nonatomic, assign) CGRect            adFrame;            /**< 广告图片frame */
@property (nonatomic, assign) NSInteger         aDduration;         /**< 广告停留时间 */
@property (nonatomic, copy  ) NSString          *aDImageUrl;        /**< 广告图片的URL */
@property (nonatomic, assign) BOOL              aDhideSkipButton;   /**< 是否影藏'倒计时/跳过'按钮 */
@property (nonatomic, strong) UIImageView       *launchImageView;   /**< APP启动图片 */
@property (nonatomic, strong) UIImageView       *adImageView;       /**< APP广告图片 */
@property (nonatomic, strong) UIButton          *skipButton;        /**< 跳过按钮 */
@property (nonatomic, strong) dispatch_source_t timer;              /**< 设置定时器 */
@end

@implementation DHLaunchAdPageHUD
- (instancetype)initWithFrame:(CGRect)frame aDduration:(NSInteger)duration aDImageUrl:(NSString *)imageUrl hideSkipButton:(BOOL)hideSkip launchAdClickBlock:(DDLaunchAdClickBlock)aDClickBlock {
    self = [super initWithFrame:frame];
    if (self) {
        self.adFrame = frame;
        self.aDduration = duration;
        self.aDImageUrl = imageUrl;
        self.aDhideSkipButton = hideSkip;
        self.frame = [[UIScreen mainScreen] bounds];
        [self addSubview:self.setUpLaunchImageView];
        [self addSubview:self.setUpAdImageView];
        [self addSubview:self.setUpSkipButton];
        [self launchAdPageStart];
        [self launchAdPageEnd];
        [self addInWindow];
        
        self.launchAdClickBlock = aDClickBlock;
    }
    return self;
}

#pragma mark - 设置启动图片
- (UIImageView *)setUpLaunchImageView {
    if (self.launchImageView == nil) {
        self.launchImageView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.launchImageView.image = [self launchImage];
    }
    return self.launchImageView;
}

- (UIImage *)launchImage {
    CGSize viewSize = [[UIScreen mainScreen] bounds].size;
    NSString *viewOrientation = @"Portrait";/**< 横屏 @"Landscape" */
    NSString *launchImageName = nil;
    NSArray *imageArray = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dict in imageArray) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImageName = dict[@"UILaunchImageName"];
            UIImage *image = [UIImage imageNamed:launchImageName];
            return image;
        }
    }
    NSLog(@"[DHLaunchAdPageHUD]:请添加启动图片");
    return nil;
}

#pragma mark - 设置广告图片
- (UIImageView *)setUpAdImageView {
    if (self.adImageView == nil) {
        self.adImageView = [[UIImageView alloc] initWithFrame:self.adFrame];
        self.adImageView.userInteractionEnabled = YES;
        self.adImageView.alpha = 0.2;
        NSString *idString = [self.aDImageUrl substringFromIndex:self.aDImageUrl.length - 3];
        
        if ([DHRegularExpression checkURL:self.aDImageUrl]) {
            if ([idString isEqualToString:@"gif"]) {
                NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.aDImageUrl]];
                [self.adImageView addSubview:[[DHGifImageOperation alloc] initWithFrame:self.adFrame gifImageData:urlData]];
            } else {
                NSData *aDimageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.aDImageUrl]];
                [self.adImageView setImage:[[UIImage alloc] initWithData:aDimageData]];
            }
        } else {
            if ([idString isEqualToString:@"gif"]) {
                NSData *localData = [NSData dataWithContentsOfFile:self.aDImageUrl];
                [self.adImageView addSubview:[[DHGifImageOperation alloc] initWithFrame:self.adFrame gifImageData:localData]];
            } else {
                [self.adImageView setImage:[UIImage imageNamed:self.aDImageUrl]];
            }
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adImageViewTapAction:)];
        [self.adImageView addGestureRecognizer:tap];
    }
    return self.adImageView;
}

- (void)adImageViewTapAction:(UITapGestureRecognizer *)tap {
    if (self.launchAdClickBlock) {
        self.launchAdClickBlock();
    }
}

#pragma mark - 设置跳过按钮
- (UIButton *)setUpSkipButton {
    if (self.skipButton == nil) {
        self.skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.skipButton setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-70, 30, 60, 30)];
        [self.skipButton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
        [self.skipButton.layer setCornerRadius:15.0];
        [self.skipButton.layer setMasksToBounds:YES];
        [self.skipButton setHidden:self.aDhideSkipButton];
        NSInteger duration = 3.0;/**< 默认停留时间 */
        if (self.aDduration) { duration = self.aDduration; }
        [self.skipButton setTitle:[NSString stringWithFormat:@"%ld 跳过", duration] forState:UIControlStateNormal];
        [self.skipButton.titleLabel setFont:[UIFont systemFontOfSize:13.5]];
        [self.skipButton addTarget:self action:@selector(skipButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self dispath_timer];
    }
    return self.skipButton;
}

- (void)skipButtonClick {
    [self removeLaunchAdPageHUD];
}

- (void)removeLaunchAdPageHUD {
    [UIView animateWithDuration:0.8 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.transform=CGAffineTransformMakeScale(1.5, 1.5);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)dispath_timer {
    NSTimeInterval period = 1.0;/**< 每秒执行 */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), period*NSEC_PER_SEC, 0);
    
    __block NSInteger duration = 3.0;
    if (self.aDduration) { duration = self.aDduration; }
    
    dispatch_source_set_event_handler(self.timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            duration--;
            if (duration > -1) {
                [self.skipButton setTitle:[NSString stringWithFormat:@"%ld 跳过", duration] forState:UIControlStateNormal];
            } else {
                dispatch_source_cancel(self.timer);
            }
        });
    });
    dispatch_resume(self.timer);
}

#pragma mark - 设置广告图片的开始
- (void)launchAdPageStart {
    CGFloat duration = 3.0;
    if (self.aDduration) {
        duration = self.aDduration;
        duration = duration / 4.0;
        if (duration > 1.0) { duration = 1.0; }
        [UIView animateWithDuration:duration animations:^{
            self.adImageView.alpha = 1.0;
        }];
    }
}

#pragma mark - 设置广告图片的结束
- (void)launchAdPageEnd {
    CGFloat duration = 3.0;
    if (self.aDduration) { duration = self.aDduration; }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeLaunchAdPageHUD];
    });
}

#pragma mark - 添加至主窗口
- (void)addInWindow {
    /**< 检测UIApplicationDidFinishLaunchingNotification通知 */
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        /**< 等didFinishLaunchingWithOptions方法结束后,将其添加至window上(不然会检测是否有rootViewController) */
        dispatch_async(dispatch_get_main_queue(), ^{
            [[[UIApplication sharedApplication].delegate window] addSubview:self];
        });
    }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
