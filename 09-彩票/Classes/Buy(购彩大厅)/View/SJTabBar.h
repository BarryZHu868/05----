//
//  SJTarBar.h
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/19.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SJTabBarDelegate <NSObject>

-(void)tabBarDidSelectBtnFromL:(NSInteger) from  to:(NSInteger) to;

@end

@interface SJTabBar : UIView


@property(nonatomic,weak) id<SJTabBarDelegate> delegate;



//提供给外界创建按钮
-(void)addTabBarButtonWithNormalImageName:(NSString *)norName andDisableImageName:(NSString *)disName;

@end
