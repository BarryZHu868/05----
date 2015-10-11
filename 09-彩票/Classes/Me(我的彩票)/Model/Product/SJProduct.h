//
//  SJProduct.h
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/28.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJProduct : NSObject

@property(nonatomic,copy) NSString *title;

@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *schemes;//custimUrl
@property(nonatomic,copy) NSString *identifier;//id
@property(nonatomic,copy) NSString *url;//url

-(instancetype) initWithDict:(NSDictionary *)dict;
+(instancetype) productWithDict:(NSDictionary *)dict;

@end
