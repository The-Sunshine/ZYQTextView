//
//  ViewController.m
//  ZYQTextView
//
//  Created by bjzyzl on 2017/8/8.
//  Copyright © 2017年 zyq. All rights reserved.
//

#import "ViewController.h"
#import "ZYQTextView.h"

@interface ViewController ()<ZYQTextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZYQTextView * tv = [[ZYQTextView alloc]init];
    tv.frame = CGRectMake(100, 100, 100, 30);
    tv.placeholder = @"请输入...";
    tv.autoHeight = YES;
    tv.layer.borderWidth = .2;
    tv.layer.borderColor = [UIColor blackColor].CGColor;
    tv.layer.cornerRadius = 5;
    [self.view addSubview:tv];
}

-(void)didChangeClick
{
    NSLog(@"正在编辑");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
