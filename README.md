# DHLaunchPageHUD
###一行代码迅速集成APP启动页,包括有广告(Ad)和无广告(Df)两种样式,省掉冗余的代码,集成性高,使用方便;
## (一)DHLaunchAdPageHUD - 有广告(Ad)
### 效果图展示:

### 方法说明:
```objc
/**
 *  DHLaunchAdPageHUD
 *
 *  @param frame        位置大小
 *  @param duration     广告停留的时间
 *  @param imageUrl     显示广告的图片(这里可以使用本地图片也可以使用网络图片,使用时只传入URL即可,SDK会自动是识别png\jpg\gif的图片)
 *  @param hideSkip     是否隐藏跳过按钮(YES:隐藏; NO不隐藏)
 *  @param aDClickBlock 用户点击广告图片的回调Block
 *
 *  @return DHLaunchAdPageHUD对象
 */
- (instancetype)initWithFrame:(CGRect)frame aDduration:(NSInteger)duration aDImageUrl:(NSString *)imageUrl hideSkipButton:(BOOL)hideSkip launchAdClickBlock:(DDLaunchAdClickBlock)aDClickBlock;
```

### 使用方式:
####1.下载项目或者下载项目中的DHLaunchAdPageHUD文件,将下载好的DHLaunchAdPageHUD文件拖拽到自己的工程文件夹中,并在自己添加广告启动页的类中导入#import "DHLaunchAdPageHUD.h"头文件;
####2.初始化"DHLaunchAdPageHUD"一行代码就可以搞定,代码如下:
```objc
NSString *adImageJPGUrl = @"http://p5.image.hiapk.com/uploads/allimg/150112/7730-150112143S3.jpg";
NSString *adimageGIFUrl = @"http://img.ui.cn/data/file/3/4/6/210643.gif";
NSString *adImageJPGPath = [[NSBundle mainBundle] pathForResource:@"adImage2" ofType:@"jpg"];
NSString *adImageGifPath = [[NSBundle mainBundle] pathForResource:@"adImage3" ofType:@"gif"];

DHLaunchAdPageHUD *launchAd = [[DHLaunchAdPageHUD alloc] initWithFrame:CGRectMake(0, 0, DDScreenW, DDScreenH-100) aDduration:6.0 aDImageUrl:adImageGifPath hideSkipButton:NO launchAdClickBlock:^{
        NSLog(@"点了广告图片");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    }];
```
####说明:图片来源于网络,如有设计版权会马上删除,敬请谅解;
### 可能会用到的代码说明:

## (二)DHLaunchDfPageHUD - 无广告(Df)
### 效果图展示:

### 方法说明:

### 使用方式:

### 可能会用到的代码说明:

## <<分享是一种美德,Star是一种鼓励![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DHGuidePageHUDExample/DHGuidePageHUDExampleUITests/Untitled-star/Untitled-star.png)>>