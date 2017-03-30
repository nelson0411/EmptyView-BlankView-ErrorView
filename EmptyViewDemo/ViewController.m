//
//  ViewController.m
//  EmptyViewDemo
//
//  Created by wuna on 17/3/30.
//  Copyright © 2017年 wuna. All rights reserved.
//

#import "ViewController.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "ShowViewController.h"
#import "CommonViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
@synthesize listView;
@synthesize dataArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.listView = [[UITableView alloc]init];
    self.listView.dataSource = self;
    self.listView.delegate = self;
    [self.view addSubview:self.listView];
    
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    self.dataArray = @[@"空数据页",@"错误页",@"切换",@"简单示例"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        CommonViewController *subVC = [[CommonViewController alloc]init];
        subVC.title = dataArray[indexPath.row];
        [self.navigationController pushViewController:subVC animated:YES];
    }else{
        ShowViewController *subVC = [[ShowViewController alloc]init];
        subVC.index = indexPath.row;
        subVC.title = dataArray[indexPath.row];
        [self.navigationController pushViewController:subVC animated:YES];
    }
}

@end
