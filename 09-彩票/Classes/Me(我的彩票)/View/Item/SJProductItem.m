//
//  SJProductItem.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/28.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJProductItem.h"
#import "SJProduct.h"
@interface SJProductItem()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation SJProductItem

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
        self.iconView.layer.cornerRadius = 8;
        //设置超出主图层的部分剪切
        self.iconView.layer.masksToBounds = YES;
//        NSLog(@"initWithCoder");
    }
    return self;
}

-(void)awakeFromNib
{
    self.iconView.layer.cornerRadius = 8;
    //设置超出主图层的部分剪切
    self.iconView.layer.masksToBounds = YES;
//    NSLog(@"awakeFromNib");
}


-(void)setProduct:(SJProduct *)product
{
    _product = product;
    
    //设置图标
//    NSLog(@"%@",self.product.icon);
    self.iconView.image = [UIImage imageNamed:self.product.icon];
    //设置名称
    self.nameLabel.text = self.product.title;
}

@end
