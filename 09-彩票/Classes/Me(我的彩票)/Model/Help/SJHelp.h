//
//  SJHelp.h
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/29.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJHelp : NSObject
@property(nonatomic,copy) NSString *title;

@property(nonatomic,copy) NSString *html;

@property(nonatomic,copy) NSString *tagtId;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)helpWithDict:(NSDictionary *)dict;

@end
