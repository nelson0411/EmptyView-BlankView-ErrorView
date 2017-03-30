//
//  UIView+WNEmptyView.m
//  danche
//
//  Created by wuna on 17/3/30.
//  Copyright © 2017年 wuna. All rights reserved.
//

#import "UIView+WNEmptyView.h"
#import <objc/runtime.h>

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

static const void *ErrorImageNameKey        = &ErrorImageNameKey;
static const void *ErrorPreTitleKey         = &ErrorPreTitleKey;
static const void *ErrorSubTitleKey         = &ErrorSubTitleKey;
static const void *ErrorButtonTitleKey      = &ErrorButtonTitleKey;

static const void *BlankImageNameKey        = &BlankImageNameKey;
static const void *BlankPreTitleKey         = &BlankPreTitleKey;
static const void *BlankSubTitleKey         = &BlankSubTitleKey;
static const void *BlankButtonTitleKey      = &BlankButtonTitleKey;

@interface UIView ()
@property (nonatomic,copy) void(^reloadAction)();
@end

@implementation UIView (WNEmptyView)

#pragma mark -- private method --
- (void)configReloadAction:(void (^)())block
{
    self.reloadAction = block;
    if (self.errorPageView && self.reloadAction) {
        self.errorPageView.didClickReloadBlock = self.reloadAction;
    }
    if (self.blankPageView && self.reloadAction) {
        self.blankPageView.didClickReloadBlock = self.reloadAction;
    }
}

- (void)showErrorPageView
{
    if (!self.errorPageView) {
        self.errorPageView = [[WNErrorPageView alloc]initWithFrame:self.bounds];
        //--刷新事件
        if (self.reloadAction) {
            self.errorPageView.didClickReloadBlock = self.reloadAction;
        }
        //--logo名称
        if (self.errorImageName) {
            self.errorPageView.imageName = self.blankImageName;
        }else{
            self.errorPageView.imageName = @"icon_no_netWork";
        }
        //--标题
        if (self.errorPreTitle) {
            self.errorPageView.preTitle = self.errorPreTitle;
        }else{
            self.errorPageView.preTitle = @"哎呀，网络不给力，请重新加载";
        }
        //--副标题
        if (self.errorSubTitle) {
            self.errorPageView.subTitle = self.errorSubTitle;
        }
        //--刷新按钮标题
        if (self.errorButtonTitle) {
            self.errorPageView.buttonTitle = self.errorButtonTitle;
        }
    }
    [self addSubview:self.errorPageView];
    [self bringSubviewToFront:self.errorPageView];
    [self hideBlankPageView];
}

- (void)hideErrorPageView
{
    if (self.errorPageView) {
        [self.errorPageView removeFromSuperview];
        self.errorPageView = nil;
    }
}

- (void)showBlankPageView
{
    if (!self.blankPageView) {
        self.blankPageView = [[WNErrorPageView alloc]initWithFrame:self.bounds];
        //--刷新事件
        if (self.reloadAction) {
            self.blankPageView.didClickReloadBlock = self.reloadAction;
        }
        //--logo名称
        if (self.blankImageName) {
            self.blankPageView.imageName = self.blankImageName;
        }else{
            self.blankPageView.imageName = @"icon_no_data";
        }
        //--标题
        if (self.blankPreTitle) {
            self.blankPageView.preTitle = self.blankPreTitle;
        }else{
            self.blankPageView.preTitle = @"暂无数据";
        }
        //--副标题
        if (self.blankSubTitle) {
            self.blankPageView.subTitle = self.blankSubTitle;
        }
        //--刷新按钮标题
        if (self.blankButtonTitle) {
            self.blankPageView.buttonTitle = self.blankButtonTitle;
        }
    }
    [self addSubview:self.blankPageView];
    [self bringSubviewToFront:self.blankPageView];
    [self hideErrorPageView];
}

- (void)hideBlankPageView{
    if (self.blankPageView) {
        [self.blankPageView removeFromSuperview];
        self.blankPageView = nil;
    }
}

#pragma mark -- setter and getter
//--errorImageName--
- (void)setErrorImageName:(NSString *)errorImageName{
    objc_setAssociatedObject(self, ErrorImageNameKey, errorImageName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.errorPageView) {
        self.errorPageView.imageName = errorImageName;
    }
}
- (NSString *)errorImageName{
    return objc_getAssociatedObject(self, ErrorImageNameKey);
}

//--errorPreTitle--
- (void)setErrorPreTitle:(NSString *)errorPreTitle{
    objc_setAssociatedObject(self, ErrorPreTitleKey, errorPreTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.errorPageView) {
        self.errorPageView.preTitle = errorPreTitle;
    }
}
- (NSString *)errorPreTitle{
    return objc_getAssociatedObject(self, ErrorPreTitleKey);
}

//--errorSubTitle--
- (void)setErrorSubTitle:(NSString *)errorSubTitle{
    objc_setAssociatedObject(self, ErrorSubTitleKey, errorSubTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.errorPageView) {
        self.errorPageView.subTitle = errorSubTitle;
    }
}
- (NSString *)errorSubTitle{
    return objc_getAssociatedObject(self, ErrorSubTitleKey);
}

//--errorButtonTitle--
- (void)setErrorButtonTitle:(NSString *)errorButtonTitle{
    objc_setAssociatedObject(self, ErrorButtonTitleKey, errorButtonTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.errorPageView) {
        self.errorPageView.buttonTitle = errorButtonTitle;
    }
}
- (NSString *)errorButtonTitle{
    return objc_getAssociatedObject(self, ErrorButtonTitleKey);
}

//--blankImageName--
- (void)setBlankImageName:(NSString *)blankImageName{
    objc_setAssociatedObject(self, BlankImageNameKey, blankImageName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.blankPageView) {
        self.blankPageView.imageName = blankImageName;
    }
}
- (NSString *)blankImageName{
    return objc_getAssociatedObject(self, BlankImageNameKey);
}

//--blankPreTitle--
- (void)setBlankPreTitle:(NSString *)blankPreTitle{
    objc_setAssociatedObject(self, BlankPreTitleKey, blankPreTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.blankPageView) {
        self.blankPageView.preTitle = blankPreTitle;
    }
}
- (NSString *)blankPreTitle{
    return objc_getAssociatedObject(self, BlankPreTitleKey);
}

//--blankSubTitle--
- (void)setBlankSubTitle:(NSString *)blankSubTitle{
    objc_setAssociatedObject(self, BlankSubTitleKey, blankSubTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.blankPageView) {
        self.blankPageView.subTitle = blankSubTitle;
    }
}
- (NSString *)blankSubTitle{
    return objc_getAssociatedObject(self, BlankSubTitleKey);
}

//--blankButtonTitle--
- (void)setBlankButtonTitle:(NSString *)blankButtonTitle{
    objc_setAssociatedObject(self, BlankButtonTitleKey, blankButtonTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.blankPageView) {
        self.blankPageView.buttonTitle = blankButtonTitle;
    }
}
- (NSString *)blankButtonTitle{
    return objc_getAssociatedObject(self, BlankButtonTitleKey);
}

//--reloadAction--
- (void)setReloadAction:(void (^)())reloadAction{
    objc_setAssociatedObject(self, @selector(reloadAction), reloadAction, OBJC_ASSOCIATION_COPY);
}
- (void (^)())reloadAction{
    return objc_getAssociatedObject(self, _cmd);
}

//--WNErrorPageView--
- (void)setErrorPageView:(WNErrorPageView *)errorPageView{
    [self willChangeValueForKey:NSStringFromSelector(@selector(errorPageView))];
    objc_setAssociatedObject(self, @selector(errorPageView), errorPageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:NSStringFromSelector(@selector(errorPageView))];
}
- (WNErrorPageView *)errorPageView{
    return objc_getAssociatedObject(self, _cmd);
}

//--WNBlankPageView--
- (void)setBlankPageView:(WNErrorPageView *)blankPageView{
    [self willChangeValueForKey:NSStringFromSelector(@selector(blankPageView))];
    objc_setAssociatedObject(self, @selector(blankPageView), blankPageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:NSStringFromSelector(@selector(blankPageView))];
}
- (WNErrorPageView *)blankPageView{
    return objc_getAssociatedObject(self, _cmd);
}

@end

#pragma mark ---  WNErrorPageView
@interface WNErrorPageView ()
@property (nonatomic,strong) UIImageView    *errorImageView;
@property (nonatomic,strong) UILabel        *errorTipLabel;
@property (nonatomic,strong) UILabel        *errorSubLabel;
@property (nonatomic,strong) UIButton       *reloadButton;
@end

@implementation WNErrorPageView
@synthesize didClickReloadBlock=_didClickReloadBlock;

- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        //--
        UIImageView *errorImageView = [[UIImageView alloc]init];
        _errorImageView = errorImageView;
        [self addSubview:_errorImageView];
        
        //--
        UILabel *errorTipLabel = [[UILabel alloc]init];
        errorTipLabel.font = [UIFont systemFontOfSize:16];
        errorTipLabel.textAlignment = NSTextAlignmentCenter;
        errorTipLabel.textColor = HexRGB(0x999999);
        _errorTipLabel = errorTipLabel;
        [self addSubview:_errorTipLabel];
        
        //--
        UILabel *errorSubLabel = [[UILabel alloc]init];
        errorSubLabel.font = [UIFont systemFontOfSize:16];
        errorSubLabel.textAlignment = NSTextAlignmentCenter;
        errorSubLabel.textColor = HexRGB(0x999999);
        _errorSubLabel = errorSubLabel;
        [self addSubview:_errorSubLabel];
        
        //--
        UIButton *reloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        reloadButton.titleLabel.font = [UIFont systemFontOfSize:14];
        reloadButton.layer.cornerRadius = 15;
        reloadButton.backgroundColor = [UIColor lightGrayColor];
        [reloadButton addTarget:self action:@selector(_clickReloadButton:) forControlEvents:UIControlEventTouchUpInside];
        _reloadButton = reloadButton;
        [self addSubview:_reloadButton];
        
        //--errorImage 和 tiplabel是必须有内容
        [_errorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self.mas_centerY).offset(-100);
        }];
        
        [_errorTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.equalTo(@20);
            make.top.equalTo(_errorImageView.mas_bottom).offset(30);
        }];
        
        //--
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

- (void)_clickReloadButton:(UIButton *)btn{
    if (_didClickReloadBlock) {
        _didClickReloadBlock();
    }
}

- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    [self _clickReloadButton:nil];
}

#pragma mark -- setter and getter
- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    _errorImageView.image = [UIImage imageNamed:imageName];
    [self setNeedsDisplay];
}

- (void)setPreTitle:(NSString *)preTitle
{
    _preTitle = preTitle;
    _errorTipLabel.text = preTitle;
    [self setNeedsDisplay];
}

- (void)setSubTitle:(NSString *)subTitle
{
    _subTitle = subTitle;
    _errorSubLabel.text = subTitle;
    
    if (subTitle) {
        [self addSubview:_errorSubLabel];
        [_errorSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.equalTo(@20);
            make.top.equalTo(_errorTipLabel.mas_bottom).offset(15);
        }];
    }else{
        [_errorSubLabel removeFromSuperview];
    }
    [self setNeedsDisplay];
}

- (void)setButtonTitle:(NSString *)buttonTitle
{
    _buttonTitle = buttonTitle;
    [_reloadButton setTitle:buttonTitle forState:UIControlStateNormal];

    if (buttonTitle) {
        [self addSubview:_reloadButton];
        [_reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(30);
            make.centerX.equalTo(self);
            if (_subTitle) {
                make.top.equalTo(_errorSubLabel.mas_bottom).offset(15);
            }else{
                make.top.equalTo(_errorTipLabel.mas_bottom).offset(15);
            }
        }];
    }else{
        [_reloadButton removeFromSuperview];
    }
    
    [self setNeedsDisplay];
}

@end
