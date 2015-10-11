//
//  SJProductCell.h
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/25.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SJSettingItem;

@interface SJSettingCell : UITableViewCell
@property(nonatomic,strong) SJSettingItem *item;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
