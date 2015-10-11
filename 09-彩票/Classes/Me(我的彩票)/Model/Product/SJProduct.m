//
//  SJProduct.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/28.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJProduct.h"

@implementation SJProduct

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self = [super init]){
        //模型中的属性必须喝字典中的key一模一样
//        [self setValuesForKeysWithDictionary:dict];
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.schemes = dict[@"customUrl"];
        self.identifier = dict[@"id"];
        self.url = dict[@"url"];
    }
    return self;
}

+(instancetype)productWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
