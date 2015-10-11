//
//  SJPushNoticeController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/28.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJPushNoticeController.h"
#import "NJTestViewController.h"
#import "SJAwardViewController.h"
#import "SJAwardAnimationViewController.h"
#import "SJScoreTimeViewController.h"
@interface SJPushNoticeController ()

@end

@implementation SJPushNoticeController
-(void)add0SectionItems
{
    SJSettingItem *item00 = [[SJSettingArrowItem alloc] initWithIcon:nil title:@"开奖号码推送" destClass:[SJAwardViewController class]];
    SJSettingItem *item01 = [[SJSettingArrowItem alloc] initWithIcon:nil title:@"中奖动画" destClass:[SJAwardAnimationViewController class]];
    SJSettingItem *item02 = [[SJSettingArrowItem alloc] initWithIcon:nil title:@"比分直播" destClass:[SJScoreTimeViewController class]];
    SJSettingItem *item03 = [[SJSettingArrowItem alloc] initWithIcon:nil title:@"购彩定时提醒" destClass:[NJTestViewController class]];
    
    
    NJProductGroup *group1 = [[NJProductGroup alloc] init];
    group1.items = @[item00 ,item01,item02,item03];
    [self.datas addObject:group1];
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self add0SectionItems];
   
}
@end
