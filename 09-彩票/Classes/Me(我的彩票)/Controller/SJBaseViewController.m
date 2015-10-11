//
//  SJSettingController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/25.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJBaseViewController.h"
#import "NJTestViewController.h"


@interface SJBaseViewController ()


@end

@implementation SJBaseViewController
#pragma mark - 懒加载
-(NSArray *)datas
{
    if(_datas == nil){
       
        
        _datas = [NSMutableArray array];
        
    }
    return _datas;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    //清空系统的backgroundView
    self.tableView.backgroundView = nil;
    
    
}

-(instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //取出对应组的小数组
    //    NSArray *arr = self.datas[section];
    NJProductGroup *g = self.datas[section];
    //返回小数组长度
    return  g.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SJSettingCell *cell = [SJSettingCell cellWithTableView:tableView];
    
    // 先取出对应组的组模型
    NJProductGroup *g = self.datas[indexPath.section];
    //  从组模型中取出对应行的模型
    SJSettingItem *item = g.items[indexPath.row];
    cell.item = item;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //立即取消选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NJProductGroup *g = self.datas[indexPath.section];
    //  从组模型中取出对应行的模型
    SJSettingItem *item = g.items[indexPath.row];
    //判断block中是否保存代码
    if(item.option != nil){
        //如果保存，就执行block中保存的代码
        item.option();
    }else if([item isKindOfClass:[SJSettingArrowItem class]]){
        // 创建目标控制并且添加到栈中
        SJSettingArrowItem *arrowItem = (SJSettingArrowItem *)item;
        if(arrowItem.destVc != nil){
            
            UIViewController *vc = [[arrowItem.destVc alloc] init];
            //设置目标控制器导航条的标题
            vc.navigationItem.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 先取出对应组的组模型
    NJProductGroup *g = self.datas[section];
    return g.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 先取出对应组的组模型
    NJProductGroup *g = self.datas[section];
    return g.footerTitle;
}

@end
