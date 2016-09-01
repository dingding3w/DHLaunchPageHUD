# DHLaunchPageHUD
### 一行代码迅速集成APP启动页,包括有广告(Ad)和无广告(Df)两种样式,省掉冗余的代码,集成性高,使用方便;
####声明: 部分图片来源于网络,如有涉及版权会马上删除,敬请谅解;
## (一)DHLaunchAdPageHUD - 有广告(Ad)
### 效果图展示:
<table>
	<tr>
		<th>加载网络静态图片广告</th>
		<th>加载网络动态图片广告</th>
		<th>加载本地静态图片广告</th>
		<th>加载本地动态图片广告</th>
	</tr>

	<tr>
		<td><img src="https://github.com/dingding3w/DHLaunchPageHUD/blob/master/DHLaunchAdPageHUD/DesignSketchGIF/Untitled-1.gif" width="300"></td>
		<td><img src="https://github.com/dingding3w/DHLaunchPageHUD/blob/master/DHLaunchAdPageHUD/DesignSketchGIF/Untitled-2.gif" width="300"></td>
		<td><img src="https://github.com/dingding3w/DHLaunchPageHUD/blob/master/DHLaunchAdPageHUD/DesignSketchGIF/Untitled-3.gif" width="300"></td>
		<td><img src="https://github.com/dingding3w/DHLaunchPageHUD/blob/master/DHLaunchAdPageHUD/DesignSketchGIF/Untitled-4.gif" width="300"></td>
	</tr>
</table>

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
####1.下载项目或者下载项目中的DHLaunchAdPageHUD文件,将下载好的DHLaunchAdPageHUD文件拖拽到自己的工程文件夹中,并在application:didFinishLaunchingWithOptions:方法中导入#import "DHLaunchAdPageHUD.h"头文件;
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

### 可能会用到的代码说明:

## (二)DHLaunchDfPageHUD - 无广告(Df)
### 效果图展示:

### 方法说明:
```objc
/**
 *  DHLaunchDfPageHUD
 *
 *  @param frame  位置大小
 *  @param window 主窗口
 *  @param image  启动图片
 *  @param style  启动样式
 */
- (void)initWithFrame:(CGRect)frame window:(UIWindow *)window image:(UIImage *)image animationStyle:(DDLaunchPageAnimationStyle)style;
```

### 使用方式:
####1.下载项目或者下载项目中的DHLaunchDfPageHUD文件,将下载好的DHLaunchDfPageHUD文件拖拽到自己的工程文件夹中,并在application:didFinishLaunchingWithOptions:方法中导入#import "DHLaunchDfPageHUD.h"头文件;
####2.初始化"DHLaunchAdPageHUD"一行代码就可以搞定,代码如下:
```objc
[[DHLaunchDfPageHUD alloc] initWithFrame:[[UIScreen mainScreen] bounds] window:self.window image:[UIImage imageNamed:@"LaunchDfPageImage.bundle/DHLaunchDfPageHUD.png"] animationStyle:DDLaunchPageAnimationStyleFadeOut];
```

### 部分代码说明:
####1.设置DHLaunchDfPageHUD消失的动画样式:
```objc
// 淡出效果
DDLaunchPageAnimationStyleFadeOut
// 淡入效果
DDLaunchPageAnimationStyleFadeIn
// 从中间剪开(实现中)
DDLaunchPageAnimationStyleClip
// 倾倒效果
DDLaunchPageAnimationStyleToppleOver
// 水波效果
DDLaunchPageAnimationStyleWaterWave
// 吸走效果
DDLaunchPageAnimationStyleSuckEffect
// 翻转效果
DDLaunchPageAnimationStyleOglFlip
// 立方体效果
DDLaunchPageAnimationStyleCube
// 推开效果
DDLaunchPageAnimationStyleReveal
// 翻书效果
DDLaunchPageAnimationStylePageCurl
// 合书效果
DDLaunchPageAnimationStylePageUnCurl
```

### 可能会用到的代码说明:

## <<分享是一种美德,Star是一种鼓励![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DHGuidePageHUDExample/DHGuidePageHUDExampleUITests/Untitled-star/Untitled-star.png)>>