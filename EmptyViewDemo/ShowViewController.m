//
//  ShowViewController.m
//  EmptyViewDemo
//
//  Created by wuna on 17/3/30.
//  Copyright © 2017年 wuna. All rights reserved.
//

#import "ShowViewController.h"
#import "UIView+WNEmptyView.h"

@interface ShowViewController ()
@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) UIStepper *stepper;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end

#define SUBTITLE    @"SUBTITLE"
#define BUTTON      @"BUTTON"
#define KeyWindow                 [[UIApplication sharedApplication] keyWindow]

@implementation ShowViewController
@synthesize index;

static int temp = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.dict = @{SUBTITLE:@"我是副标题，我是副标题",
                  BUTTON:@"点击刷新"};
    
    //--
    self.stepper = [[UIStepper alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    self.stepper.minimumValue = 0;
    self.stepper.maximumValue = 2;
    self.stepper.stepValue = 1;
    [self.stepper addTarget:self action:@selector(stepperAction:)
      forControlEvents:UIControlEventValueChanged];

    
    //--
    self.segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"空数据页",@"错误页"]];
    self.segmentedControl.frame = CGRectMake(50, 140, 250.0, 30.0);
    self.segmentedControl.tintColor = [UIColor redColor];
    [self.segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents: UIControlEventValueChanged];  //添加委托方法

    //--
    switch (index) {
        case 0://空数据页
            [self.view showBlankPageView];
            [KeyWindow addSubview:self.stepper];
            break;
        case 1://错误页
            [self.view showErrorPageView];
            [KeyWindow addSubview:self.stepper];
            break;
        case 2://切换
            [self.view showBlankPageView];
            [KeyWindow addSubview:self.stepper];
            [KeyWindow addSubview:self.segmentedControl];
            break;
        default:
            break;
    }
    
    //--
    [self.view configReloadAction:^{
        NSLog(@"reloadDate");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self.segmentedControl removeFromSuperview];
    [self.stepper removeFromSuperview];
}

- (void)viewWillAppear:(BOOL)animated
{
    if (index == 0) {//空数据页
        
        switch (temp) {
            case 0:
                self.view.blankPreTitle = @"空数据页";//这一行注释掉会显示默认值
                break;
            case 1:
                self.view.blankSubTitle = self.dict[SUBTITLE];
                break;
            case 2:
                self.view.blankSubTitle = self.dict[SUBTITLE];
                self.view.blankButtonTitle = self.dict[BUTTON];
                break;
                
            default:
                break;
        }
        
        [self.view showBlankPageView];
        
    }else{//错误页
        
        switch (temp) {
            case 0:
                self.view.errorPreTitle = @"错误页";//这一行注释掉会显示默认值
                break;
            case 1:
                self.view.errorSubTitle = self.dict[SUBTITLE];
                break;
            case 2:
                self.view.errorSubTitle = self.dict[SUBTITLE];
                self.view.errorButtonTitle = self.dict[BUTTON];
                break;
                
            default:
                break;
        }
        
        [self.view showErrorPageView];
    }
}

- (void)stepperAction:(UIStepper *)sender
{
    temp = (int)sender.value;
    [self viewWillAppear:YES];
}

-(void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index) {
        case 0:
            self.index = 0;
            break;
        case 1:
            self.index = 1;
            break;
        default:
            break;
    }
    [self.stepper setValue:0];temp=0;
    [self viewWillAppear:YES];
}

@end
