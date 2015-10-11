//
//  SJTitleButton.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/21.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJTitleButton.h"
#import <Availability.h>
@interface SJTitleButton()
@property(nonatomic,strong)UIFont *myFont;
@end
@implementation SJTitleButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self setup];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
        [self setup];
    }
    return self;
}

-(void)setup
{
    //纪录按钮标题的字体
    self.myFont = [UIFont systemFontOfSize:15];
    //设置标题的字体
    self.titleLabel.font = self.myFont;
    //设置按钮的图片显示的内容默认为不拉伸
    self.imageView.contentMode = UIViewContentModeCenter;
}

//用于返回按钮上标题的位置，传入按钮的rect
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleH = contentRect.size.height;
    //获取当前按钮上的文字
    NSString *title = self.currentTitle;
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    //死循环的原因是self.titileLabel需要访问titleLabel，而self.titleLabel又需要调用当前方法获取title的范围，
//    md[NSFontAttributeName] = self.titleLabel.font;
    md[NSFontAttributeName] = self.myFont;
    //计算文字的范围
    CGFloat titleW = 0;
    //判断是否xcode5，就编译以下代码，如果不是就不编译
#ifdef __IPHONE_7_0
    if(iOS7){
        //是iOS7
        CGRect titleRect = [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:md context:nil];
        titleW = titleRect.size.width;
    }else {
        //非iOS7
        CGSize titleSize = [title sizeWithFont:self.myFont];
        titleW = titleSize.width;
    }
#else
    //xcode4
    CGSize titleSize = [title sizeWithFont:self.myFont];
    titleW = titleSize.width;
#endif
    
    
    
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = 16;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}


@end
