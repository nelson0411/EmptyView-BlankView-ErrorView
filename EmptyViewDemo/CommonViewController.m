//
//  CommonViewController.m
//  EmptyViewDemo
//
//  Created by wuna on 17/3/30.
//  Copyright © 2017年 wuna. All rights reserved.
//

#import "CommonViewController.h"
#import "UIView+WNEmptyView.h"

@interface CommonViewController ()

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //-----type 1-----
    //show的位置放哪里都可以，无所谓。
    //[self.view showBlankPageView];
    [self.view showErrorPageView];
    
    //-----type 2-----
    //self.view.errorSubTitle = @"副标题";
    //self.view.errorButtonTitle = @"点击刷新";
    self.view.blankSubTitle = @"副标题";
    self.view.blankButtonTitle = @"点击刷新";
    
    //-----type 3-----
    //self.view.errorImageName = @"icon_no_data";
    //self.view.errorPreTitle = @"标题";
    //self.view.errorSubTitle = @"副标题";
    //self.view.errorButtonTitle = @"点击刷新";
    self.view.blankImageName = @"icon_no_data";
    self.view.blankPreTitle = @"标题";
    self.view.blankSubTitle = @"副标题";
    self.view.blankButtonTitle = @"点击刷新";
    
    //-----type 4-----
    [self.view configReloadAction:^{
        NSLog(@"ReloadAction");
    }];
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

@end
