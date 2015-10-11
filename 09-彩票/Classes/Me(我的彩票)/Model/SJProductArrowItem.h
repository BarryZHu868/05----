//
//  SJProductArrowItem.h
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/25.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJSettingItem.h"

@interface SJSettingArrowItem : SJSettingItem

//目标控制器
@property(nonatomic,assign) Class destVc;
-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc;
@end
