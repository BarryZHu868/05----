//
//  SJHelp.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/29.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJHelp.h"

@implementation SJHelp


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self = [super init]){
        
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.tagtId = dict[@"id"];
    }
    return self;
}

+(instancetype)helpWithDict:(NSDictionary *)dict
{
    return  [[self alloc] initWithDict:dict];
}

@end
