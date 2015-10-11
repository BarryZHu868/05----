//
//  SJBuyController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/21.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJBuyController.h"
#import "SJTitleButton.h"

@interface SJBuyController ()
- (IBAction)titleBtnClick:(SJTitleButton *)sender;
//定义变量纪录当前按钮的状态
@property(nonatomic,assign,getter = isOpen) BOOL open;
@property(nonatomic,weak) UIView *contentView;

@end

@implementation SJBuyController

-(void)viewDidLoad
{
    [super viewDidLoad];
    //添加将来需要显示的View
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor  = [UIColor purpleColor];
    contentView.frame = CGRectMake(0, 64, 375, 200);
    [self.view addSubview:contentView];
    self.contentView = contentView;
    //隐藏该View
    contentView.hidden = YES;
    
}



- (IBAction)titleBtnClick:(SJTitleButton *)titleBtn {
    if (!self.isOpen) {//没有打开
        [UIView animateWithDuration:1.0 animations:^{
            //旋转按钮尖尖
            titleBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
        self.open = YES;
        
        //显示内容view
        self.contentView.hidden = NO;
        
        
    }else{
        [UIView animateWithDuration:1.0 animations:^{
            //旋转按钮尖尖
            titleBtn.imageView.transform = CGAffineTransformIdentity;
        }];
        self.open = NO;
         //隐藏内容view
        self.contentView.hidden = YES;
    }
    
   
}
@end
