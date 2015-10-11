//
//  SJProductItem.h
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/25.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import <Foundation/Foundation.h>
//typedef enum
//{
//    SJProductItemTypeArrow,
//    SJProductItemTypeSwitch
//}SJProductItemType;

typedef void (^optionBlock)();

@interface SJSettingItem : NSObject
//纪录客服电话
@property(nonatomic,copy) NSString *subTitle;
//图标
@property(nonatomic,copy) NSString *icon;
//标题
@property(nonatomic,copy) NSString *title;
//目标控制器
//@property(nonatomic,assign) Class destVc;
//定义block保存将来要执行的代码

@property(nonatomic,copy) optionBlock option;

//定义属性保存cell后面显示什么类型的辅助视图
//@property(nonatomic,assign) SJProductItemType type;

//增加一个属性，专门用来保存将来用于存储状态的key



//-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc;
-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title;
@end
