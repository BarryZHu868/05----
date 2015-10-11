//
//  SJTabBarController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/19.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJTabBarController.h"
#import "SJTabBar.h"
#import "SJTabBarButton.h"

@interface SJTabBarController ()<SJTabBarDelegate>



@end
@implementation SJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //扩展控制器View
    self.edgesForExtendedLayout = UIRectEdgeTop  | UIRectEdgeBottom;
    

    //创建自定义的TabBar
//    SJTabBar *myTabBar = [[SJTabBar alloc] init];
//    myTabBar.backgroundColor = [UIColor greenColor];
//    myTabBar.frame = self.tabBar.frame;
    
    SJTabBar *myTabBar = [[SJTabBar alloc] initWithFrame:self.tabBar.bounds];//特别注意：此处frame的Y值有问题
    myTabBar.delegate = self;
//    [self.view addSubview:myTabBar];
    [self.tabBar addSubview:myTabBar];
    
//    NSLog(@"viewControllers = %lu",self.viewControllers.count);
    //根据系统子控制器的个数来创建自定一tarBar上按钮的个数
    for (int i = 0 ; i < self.viewControllers.count; i++) {
        //通知自定义TabBar创建按钮
        NSString *norImageName = [NSString stringWithFormat:@"TabBar%d",i + 1];
        NSString *disImageName = [NSString stringWithFormat:@"TabBar%dSel",i + 1];
        [myTabBar addTabBarButtonWithNormalImageName:norImageName andDisableImageName:disImageName];
        
        
    }
    //2.删除系统自带的tabBar
//    [self.tabBar removeFromSuperview];
    
        
    
    
      
    
}

#pragma mark SJTabBarDelegate
-(void)tabBarDidSelectBtnFromL:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}



@end
