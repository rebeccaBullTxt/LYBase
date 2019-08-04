//
//  LYBaseViewController.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYBaseViewController.h"
#import "LYNavigationTitleView.h"
@interface LYBaseViewController ()

@end

@implementation LYBaseViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self baseUiConfigAction];
}

#pragma mark -UI
- (void)baseUiConfigAction {
    self.view.backgroundColor = kWhiteColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.fd_prefersNavigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom;
}

#pragma mark - 监听通知
- (void)monitorNotification {
//    @weakify(self);
    //导航栏加载中
//    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:kLoadNavigationNotification object:nil] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNotification * _Nullable x) {
//        @strongify(self);
//        HTConnectState state = [x.object integerValue];
//        [self startLoading:state];
//    }];
    
    //隐藏导航栏加载框
//    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:kHideNavigationNotification object:nil] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNotification * _Nullable x) {
//        @strongify(self);
//        HTConnectState state = [x.object integerValue];
//        [self stopLoading:state];
//    }];
}

#pragma mark - 设置导航栏标题
- (void)setupTitle:(NSString *)title subTitle:(NSString *)subTitle {
    if (subTitle) {
        LYNavigationTitleView *titleView = [LYNavigationTitleView initializeXib];
        titleView.titleLabel.text = title;
        titleView.subTitleLabel.text = subTitle;
        if ([UIDevice systemVersion].floatValue < 11.0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.navigationItem.titleView = titleView;
            });
        }else {
            self.navigationItem.titleView = titleView;
        }
    }else {
        self.navigationItem.title = title;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - 释放
- (void)dealloc {
    LYLog(@"释放%@成功",NSStringFromClass([self class]));
}

@end
