//
//  SJAboutViewController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/10/1.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJAboutViewController.h"
#import "NJAboutHeaderView.h"

@interface SJAboutViewController ()
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation SJAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SJSettingItem *item00 = [[SJSettingArrowItem alloc] initWithIcon:nil title:@"评分支持"];
    item00.option = ^{
        NSString *appid = @"717804289";
        NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", appid];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

    };
    SJSettingItem *item01 = [[SJSettingArrowItem alloc] initWithIcon:nil title:@"客服电话"];
    item01.subTitle = @"1234556789";
    item01.option = ^{
        //打电话
        //弊端：试用该方法进行拨号之后，当电话挂断之后不会返回应用程序，会停留在通话记录界面
//        NSURL *url = [NSURL URLWithString:@"tel://18637739085"];
//        [[UIApplication sharedApplication] openURL:url];
        //在拨打电话之后会提示用户是否拨打，当电话挂断之后会返回应用程序
        //弊端：审核不通过，苹果私有的api
//        NSURL *url = [NSURL URLWithString:@"telprompt://18637739085"];
//        [[UIApplication sharedApplication] openURL:url];
        
        if(_webView == nil){
            _webView = [[UIWebView alloc] initWithFrame:CGRectZero];
            
        }
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://10010"]]];
        
    };
    
    
    
    NJProductGroup *group1 = [[NJProductGroup alloc] init];
    
    group1.items = @[item00, item01];
    [self.datas addObject:group1];
    self.tableView.tableHeaderView = [NJAboutHeaderView headerView];
}


@end
