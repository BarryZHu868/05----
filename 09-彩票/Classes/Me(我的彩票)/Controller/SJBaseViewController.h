//
//  SJBaseViewController.h
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/28.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJSettingItem.h"
#import "NJProductGroup.h"
#import "SJSettingCell.h"
#import "SJProductArrowItem.h"
#import "SJSettingSwitchItem.h"
#import "NJTestViewController.h"
#import "SJSettingLabelItem.h"

@interface SJBaseViewController : UITableViewController
@property(nonatomic,strong) NSMutableArray *datas;
@end
