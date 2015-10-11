//
//  SJSettingController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/25.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJSettingController.h"
#import "NJTestViewController.h"

#import "MBProgressHUD+NJ.h"
#import "SJProductViewController.h"
#import "SJPushNoticeController.h"
#import "SJHelpViewController.h"
#import "SJAboutViewController.h"
#import "SJShareViewController.h"

@interface SJSettingController ()


@end

@implementation SJSettingController
-(void)add0SectionItems
{
    SJSettingItem *item00 = [[SJSettingArrowItem alloc] initWithIcon:@"MorePush" title:@"推送和提醒" destClass:[SJPushNoticeController class]];
    SJSettingItem *item01 = [[SJSettingSwitchItem alloc] initWithIcon:@"MorePush" title:@"摇一摇机选"];
    
    //        NSArray *arr1 = @[item00, item01];
    NJProductGroup *group1 = [[NJProductGroup alloc] init];
    group1.items = @[item00 ,item01];
    [self.datas addObject:group1];

}
-(void)add1SectionItems
{
    SJSettingItem *updata = [[SJSettingItem alloc] initWithIcon:@"MoreUpdate" title:@"检查新版本" ];
    updata.option = ^(){
        //        NSLog(@"检查更新");
        //模拟发送网络请求
        //2秒之后删除提示
        [MBProgressHUD showMessage:@"正在拼命检查"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            //提示没有新版本
            [MBProgressHUD showSuccess:@"没有新版本"];
        });
        
    };
    

    SJSettingItem *help = [[SJSettingArrowItem alloc] initWithIcon:@"MoreHelp" title:@"帮助" destClass:[SJHelpViewController class]];
    SJSettingItem *share = [[SJSettingArrowItem alloc] initWithIcon:@"MoreShare" title:@"分享" destClass:[SJShareViewController class]];
    SJSettingItem *msg = [[SJSettingArrowItem alloc] initWithIcon:@"MoreMessage" title:@"查看消息" ];
    SJSettingItem *products = [[SJSettingArrowItem alloc] initWithIcon:@"MoreNetease" title:@"产品推荐" destClass:[SJProductViewController class]];
    SJSettingItem *about = [[SJSettingArrowItem alloc] initWithIcon:@"MoreAbout" title:@"关于" destClass:[SJAboutViewController class]];
    //        NSArray *arr2 = @[item10];
    NJProductGroup *group2 = [[NJProductGroup alloc] init];
    
    group2.items = @[updata,help, share, msg, products, about];
    [self.datas addObject:group2];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self add0SectionItems];
    [self add1SectionItems];
    self.navigationItem.title = @"设置";
      
    
   
}


@end
