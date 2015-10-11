//
//  SJProductArrowItem.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/25.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJProductArrowItem.h"

@implementation SJSettingArrowItem

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc
{
    if(self = [super initWithIcon:icon title:title]){
        
        
        self.destVc = destVc;
    }
    return self;
}

@end
