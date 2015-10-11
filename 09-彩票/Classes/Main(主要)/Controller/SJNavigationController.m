//
//  SJNavigationController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/23.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJNavigationController.h"

@interface SJNavigationController ()

@end

@implementation SJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   

}
//当该类第一次用到的时候就调用
+(void)initialize
{
//    NSLog(@"initialize");
    //3.设置导航条的主题
    //如果要同时设置很多UINavigationBar的样式，可以通过设置UINavigationBar的主题的方式来设置可以简化代码
    //3.1设置所有导航条的背景图片
    //判断当前运行的操作系统的版本
    //    NSLog(@"systemVersion = %@", [UIDevice currentDevice].systemVersion);
    UINavigationBar *navBar = [UINavigationBar appearance];
    if(iOS7){
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    }else{
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
    }
    
    //设置导航条上返回按钮和图片的颜色
    [navBar setTintColor:[UIColor whiteColor]];
    
    
    //3.2设置所有导航条的标题颜色
    
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    md[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //
    //    md[UITextAttributeTextColor] = [UIColor whiteColor];
    //    md[UITextAttributeFont] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:md];
    //设置UIBarButtonItem的主题
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    //判断是否是IOS6如果是IOS6就设置图片
    if(!iOS7){
        //设置普通按钮的图片
        UIImage *norImage = [UIImage imageNamed:@"NavButton"];
        [barItem setBackgroundImage:norImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        UIImage *higImage = [UIImage imageNamed:@"NavButtonPressed"];
        [barItem setBackgroundImage:higImage forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        //设置返回按钮的图片
        UIImage *norBackImage = [UIImage imageNamed:@"NavBackButton"];
        [barItem setBackButtonBackgroundImage:norBackImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        UIImage *higBackImage = [UIImage imageNamed:@"NavBackButtonPressed"];
        [barItem setBackButtonBackgroundImage:higBackImage forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        
    }else{
        //是iOS7
        NSMutableDictionary *barMd = [NSMutableDictionary dictionary];
        barMd[NSFontAttributeName] = [UIFont systemFontOfSize:16];
        barMd[NSForegroundColorAttributeName] = [UIColor whiteColor];
        
        [barItem setTitleTextAttributes:barMd forState:UIControlStateNormal];

    }
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    NSLog(@"pushViewController");
    //拿到目标控制器（即将要入栈的控制器），设置它的自动隐藏tabber
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

//-(UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    return [super popViewControllerAnimated:NO];
//}
@end
