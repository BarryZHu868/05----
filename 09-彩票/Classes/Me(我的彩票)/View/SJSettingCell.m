//
//  SJProductCell.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/25.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJSettingCell.h"
#import "SJSettingItem.h"
#import "SJProductArrowItem.h"
#import "SJSettingSwitchItem.h"
#import "SJSettingLabelItem.h"

@interface SJSettingCell()
@property(nonatomic,strong) UIImageView *arrowIv;
@property(nonatomic,strong) UISwitch *switchBtn;
@property(nonatomic,strong) UILabel *labelView;
@property(nonatomic,weak) UIView *divider;



@end

@implementation SJSettingCell

-(UIImageView *)arrowIv
{
    if(_arrowIv == nil){
        _arrowIv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowIv;
}

-(UISwitch *)switchBtn
{
    if(_switchBtn == nil){
        _switchBtn = [[UISwitch alloc]init];
        //添加开关的监听
        [_switchBtn addTarget:self action:@selector(switchBtnChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchBtn;
}

-(void)switchBtnChange
{
//    NSLog(@"switchBtnChange");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.switchBtn.isOn forKey:self.item.title];
    
    [defaults synchronize];
}

-(UILabel *)labelView
{
    if(_labelView == nil){
        _labelView = [[UILabel alloc]init];
        _labelView.frame = CGRectMake(250, 0, 100, 44);
        _labelView.backgroundColor = [UIColor redColor];
    }
    return _labelView;
}


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"cell";
    SJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[SJSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //初始化操作
       
        //设置背景颜色
        [self setupBackground];
        //清空子视图的背景颜色
        [self clearSubview];
        //设置cell的宽度和屏幕一样
        
        //4.添加分割线
//        UIView *divider = [[UIView alloc] init];
//        divider.backgroundColor = [UIColor blackColor];
//        [self.contentView addSubview:divider];
//        
//        self.divider = divider;
        
    }
    return self;
}

-(void)setupBackground
{
    //1.设置cell选中状态的背景颜色
    UIView *selView = [[UIView alloc] init];
    selView.backgroundColor = SJColor(232,228,209);
    self.selectedBackgroundView = selView;
    //设置cell默认状态的背景颜色
    UIView *norView = [[UIView alloc] init];
    norView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = norView;
}

-(void)clearSubview
{
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
}



-(void)setFrame:(CGRect)frame
{
//    NSLog(@"setFrame = %@", NSStringFromCGRect(frame));
    //修改cell的宽度
//    frame.size.width += 20;
//    frame.origin.x -= 10;
    [super setFrame:frame];
}

-(void)layoutSubviews
{
//    NSLog(@"setFrame = %@", NSStringFromCGRect(self.frame));
    
    
    [super layoutSubviews];
//    CGFloat dividerX = 0;
//    CGFloat dividerW = [UIScreen mainScreen].bounds.size.width;
//    CGFloat dividerH = 1;
//    CGFloat dividerY = self.contentView.frame.size.height - dividerH;
//    
//    
//    self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
}


-(void)setItem:(SJSettingItem *)item
{
    _item = item;
    self.textLabel.text = _item.title;
    
    if(item.icon !=nil){
        self.imageView.image = [UIImage imageNamed:_item.icon];
        
    }
    //设置辅助视图
    if([_item isKindOfClass:[SJSettingArrowItem class]]){
        self.accessoryView = self.arrowIv;
        self.detailTextLabel.text = self.item.subTitle;
    }else if([_item isKindOfClass:[SJSettingSwitchItem class]]){
        self.accessoryView = self.switchBtn;
        //回复存储状态
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.switchBtn.on = [defaults boolForKey:self.item.title];
        
        
        //设置没有选中样式
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if([_item isKindOfClass:[SJSettingLabelItem class]]){
        self.accessoryView = self.labelView;
    }else{
        self.accessoryView = nil;
    }
    
}

@end
