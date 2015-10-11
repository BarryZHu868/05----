//
//  SJHtmlViewController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/29.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJHtmlViewController.h"
#import "SJHelp.h"

@interface SJHtmlViewController ()<UIWebViewDelegate>

@end

@implementation SJHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIWebView *webView = [[UIWebView alloc] init];
//    [self.view addSubview:webView];
    
    self.title = self.helpModel.title;
    //添加关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeVc)];
    
    
    //利用自定义的webView加载网页
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:self.helpModel.html ofType:nil];
    
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //当网页加载完毕之后执行javascript代码，跳转到对应的位置
    //生成对应的javascript代码
    NSString *jsStr = [NSString stringWithFormat:@"window.location.href = '#%@'",self.helpModel.tagtId];
    [webView stringByEvaluatingJavaScriptFromString:jsStr];
}

-(void)loadView
{
    self.view = [[UIWebView alloc] init];
}

-(void)closeVc
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}



@end
