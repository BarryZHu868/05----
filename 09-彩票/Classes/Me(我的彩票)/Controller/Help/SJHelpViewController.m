//
//  SJHelpViewController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/29.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJHelpViewController.h"
#import "SJHtmlViewController.h"
#import "SJHelp.h"

@interface SJHelpViewController ()

@property(nonatomic,strong) NSArray *helps;

@end

@implementation SJHelpViewController

-(NSArray *)helps
{
    if(_helps == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *dictArry = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        
        NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:dictArry.count];
        for (NSDictionary *dict in dictArry) {
            SJHelp *help = [SJHelp helpWithDict:dict];
            [models addObject:help];
        }
        _helps = models;
        
    }
    return _helps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    SJSettingItem *item00 = [[SJSettingArrowItem alloc] initWithIcon:nil title:@"如何领奖" destClass:[SJHtmlViewController class]];
//    NJProductGroup *group = [[NJProductGroup alloc] init];
//    group.items = @[item00 ];
//    [self.datas addObject:group];
    //定义数组保存创建好的item模型
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:self.helps.count];
    
    for (SJHelp *help in self.helps) {
         SJSettingItem *item = [[SJSettingArrowItem alloc] initWithIcon:nil title:help.title destClass:nil];
        [items addObject:item];
    }
    NJProductGroup *group = [[NJProductGroup alloc] init];
    group.items = items;
    [self.datas addObject:group];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建目标控制器
    SJHtmlViewController *htmlVc = [[SJHtmlViewController alloc] init];
    
    //传递要显示的html的名称
//    NSLog(@"%@",[self.helps[indexPath.row] html]);
//    htmlVc.html = [self.helps[indexPath.row] html];
    htmlVc.helpModel = self.helps[indexPath.row];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:htmlVc];
    //以模态形式展示目标控制器
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}




@end
