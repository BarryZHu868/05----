//
//  SJTarBar.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/19.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJTabBar.h"
#import "SJTabBarButton.h"
@interface SJTabBar()

//定义变量纪录当前选中的按钮
@property(nonatomic,weak) UIButton *selectBtn;

@end

@implementation SJTabBar


-(void)addTabBarButtonWithNormalImageName:(NSString *)norName andDisableImageName:(NSString *)disName
{
    SJTabBarButton *btn = [[SJTabBarButton alloc] init];
    
    
    
    [btn setBackgroundImage:[UIImage imageNamed:norName] forState:UIControlStateNormal];
    
    
    [btn setBackgroundImage:[UIImage imageNamed:disName]forState:UIControlStateDisabled];
    
    
    [self addSubview:btn];
    
    
    
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchDown];
    //设置默认选中按钮
    if(1 == self.subviews.count){
        [self btnOnClick:btn];
    }
    //设置按钮按钮高亮状态不调整图片
    btn.adjustsImageWhenHighlighted = NO;
    
    

}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        //创建5个按钮，添加到自定义TabBar上
        for (int i = 0; i < 5;  i++) {
            
            
        }

    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i < self.subviews.count; i++) {
        
        UIButton *btn = self.subviews[i];
        CGFloat btnY = 0;
        CGFloat btnW = self.frame.size.width / self.subviews.count;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag = i;

    }
    
}

-(void)btnOnClick:(UIButton *)btn
{
    if([self.delegate respondsToSelector:@selector(tabBarDidSelectBtnFromL:to:)]){
        [self.delegate tabBarDidSelectBtnFromL:self.selectBtn.tag to:btn.tag];
    }
    self.selectBtn.enabled = YES;
    //取消上一次选中的按钮
    
    
    //设置被点击按钮为选中状态
    btn.enabled = NO;
    
    //纪录当前选中的按钮
    self.selectBtn = btn;
    
    //切换自控制器
//    self.selectedIndex = btn.tag;
    //通知TarBarController切换控制器
    
    
    
}
@end
