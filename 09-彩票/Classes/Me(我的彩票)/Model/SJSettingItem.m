//
//  SJProductItem.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/25.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJSettingItem.h"

@implementation SJSettingItem
/*
-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc
{
    if(self = [super init]){
        
        self.icon = icon;
        self.title = title;
        self.destVc = destVc;
    }
    return self;
}
 */

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title 
{
    if(self = [super init]){
        
        self.icon = icon;
        self.title = title;
            }
    return self;
}
@end
