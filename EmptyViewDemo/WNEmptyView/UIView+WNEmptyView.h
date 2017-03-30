//
//  UIView+WNEmptyView.h
//  danche
//
//  Created by wuna on 17/3/30.
//  Copyright © 2017年 wuna. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WNErrorPageView;

@interface UIView (WNEmptyView)
@property (nonatomic,strong) NSString *errorImageName;
@property (nonatomic,strong) NSString *errorPreTitle;
@property (nonatomic,strong) NSString *errorSubTitle;
@property (nonatomic,strong) NSString *errorButtonTitle;

@property (nonatomic,strong) NSString *blankImageName;
@property (nonatomic,strong) NSString *blankPreTitle;
@property (nonatomic,strong) NSString *blankSubTitle;
@property (nonatomic,strong) NSString *blankButtonTitle;

- (void)configReloadAction:(void(^)())block;

@property (nonatomic,strong) WNErrorPageView *errorPageView;
- (void)showErrorPageView;
- (void)hideErrorPageView;

@property (nonatomic,strong) WNErrorPageView *blankPageView;
- (void)showBlankPageView;
- (void)hideBlankPageView;

@end

#pragma mark --WNErrorPageView
@interface WNErrorPageView : UIView
@property (nonatomic,copy) void(^didClickReloadBlock)();
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,strong) NSString *preTitle;
@property (nonatomic,strong) NSString *subTitle;
@property (nonatomic,strong) NSString *buttonTitle;
@end
