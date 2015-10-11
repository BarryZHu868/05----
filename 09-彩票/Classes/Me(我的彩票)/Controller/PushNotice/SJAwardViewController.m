//
//  SJAwardViewController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/28.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJAwardViewController.h"

@interface SJAwardViewController ()

@end

@implementation SJAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add0SectionItems];
    }
-(void)add0SectionItems
{
    SJSettingItem *item00 = [[SJSettingSwitchItem alloc] initWithIcon:nil title:@"双色球"];
    SJSettingItem *item01 = [[SJSettingSwitchItem alloc] initWithIcon:nil title:@"大乐透"];
    
    
    
    NJProductGroup *group1 = [[NJProductGroup alloc] init];
    group1.headerTitle = @"打开设置即可在开奖后立即收到推送信息，获知开奖号码";
    group1.items = @[item00 ,item01];
    [self.datas addObject:group1];
    
}





@end
