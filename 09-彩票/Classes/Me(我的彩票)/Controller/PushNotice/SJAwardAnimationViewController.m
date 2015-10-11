//
//  SJAwardAnimationViewController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/28.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJAwardAnimationViewController.h"

@interface SJAwardAnimationViewController ()

@end

@implementation SJAwardAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add0SectionItems];
    
}
-(void)add0SectionItems
{
    SJSettingItem *item00 = [[SJSettingSwitchItem alloc] initWithIcon:nil title:@"中奖动画"];

    
    
    
    NJProductGroup *group1 = [[NJProductGroup alloc] init];
    group1.headerTitle = @"当您有新中奖订单，启动程序时通过动画提醒您。为避免过于频繁，高频彩不会提醒。";
    group1.items = @[item00 ];
    [self.datas addObject:group1];
    
}


@end
