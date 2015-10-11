//
//  SJScoreTimeViewController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/28.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJScoreTimeViewController.h"


@interface SJScoreTimeViewController ()

@end

@implementation SJScoreTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add0SectionItems];
    
}
-(void)add0SectionItems
{
    SJSettingItem *item00 = [[SJSettingSwitchItem alloc] initWithIcon:nil title:@"提醒我关注的比赛"];
    NJProductGroup *group1 = [[NJProductGroup alloc] init];
    group1.footerTitle = @"当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒。";
    group1.items = @[item00 ];
    [self.datas addObject:group1];
    
    SJSettingItem *item10 = [[SJSettingLabelItem alloc] initWithIcon:nil title:@"起始时间"];
    NJProductGroup *group2 = [[NJProductGroup alloc] init];
    group2.items = @[item10 ];
    [self.datas addObject:group2];
    
    SJSettingItem *item20 = [[SJSettingLabelItem alloc] initWithIcon:nil title:@"结束时间"];
    NJProductGroup *group3 = [[NJProductGroup alloc] init];
    group3.items = @[item20 ];
    [self.datas addObject:group3];
}


@end
