//
//  SJProductViewController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/9/28.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJProductViewController.h"
#import "SJProduct.h"
#import "SJProductItem.h"
#define SJIdentifier @"COLLECTION"

@interface SJProductViewController ()
//定义数组保存所有产品模型
@property(nonatomic,strong)NSArray *products;

@end

@implementation SJProductViewController

-(NSArray *)products
{
    if(_products == nil){
        //1.加载json中的数据
        //2.将json中的数据转换为模型
        NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *dictArray  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
//        NSLog(@"%@ ",dictArray);
        //3.将转换后的数据传递给products
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            SJProduct *product = [SJProduct productWithDict:dict];
            [models addObject:product];
        }
        _products = models;
    }
    return _products;
}

//static NSString * const reuseIdentifier = @"Cell";

-(id)init
{
    //UICollectionViewController//布局对象决定了将来CollertionView上每一个Cell显示的方式
    //创建一个布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置每一个cell的宽高(cell在CollectionView中称之为item)
    layout.itemSize = CGSizeMake(80, 80);
    //设置item行与行之间的间隙
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 10;
    //设置CollectionView距离上边
//    layout.headerReferenceSize = CGSizeMake(0, 300);
//    layout.footerReferenceSize = CGSizeMake(0, 200);
    //设置CollectionView内容部分距离控制器View上下左右的边距
//    layout.sectionInset = UIEdgeInsetsMake(10, 50, 100, 150);
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 0, 0, 0);
    
    
    if(self = [super initWithCollectionViewLayout:layout]){
        
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"产品推荐";
    // Register cell classes
//    [self.collectionView registerClass:[SJProductItem class] forCellWithReuseIdentifier:SJIdentifier];
    //如果item（cell）是通过xib描述的，就要先注册xib
    UINib *nib = [UINib nibWithNibName:@"SJProductItem" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:SJIdentifier];
    
    //设置控制器View的背景颜色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
//    self.products;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>
//告诉系统一共有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

//告诉系统第
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //indexPath.section//第几组
    //indexPath.item//第几个
    //从缓存池中获取cell
    SJProductItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SJIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.product = self.products[indexPath.item];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //1.获取点击的饿哪一个item对应的模型
//    SJProduct *product = self.products[indexPath.item];
//    NSLog(@"%@",product.title);
    //协议头://地址/路径
//    NSURL *url = [NSURL URLWithString:@"zsj://ios.itcast.cn"];
//    [[UIApplication sharedApplication] openURL:url];
    
    //1.根据模型拼接url
    SJProduct *product = self.products[indexPath.item];
    NSString *path = [NSString stringWithFormat:@"%@://%@",product.schemes,product.identifier];
    NSURL *url = [NSURL URLWithString:path];
    
    //判断能否打开应用
    UIApplication *app = [UIApplication sharedApplication];
    if([app canOpenURL:url]){
        [app openURL:url];
    }else
    {
        //没有安装应用程序就跳转到App Store
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:product.url]];
    }
    
}

@end
