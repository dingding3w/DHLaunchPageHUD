//
//  ViewController.m
//  DHLaunchPageHUDExample
//
//  Created by Apple on 16/7/26.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 设置该控制器背景图片
    UIImageView *bg_imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [bg_imageView setImage:[UIImage imageNamed:@"view_bg_image"]];
    [self.view addSubview:bg_imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
