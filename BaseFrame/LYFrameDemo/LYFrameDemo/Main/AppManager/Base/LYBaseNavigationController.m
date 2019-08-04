//
//  LYBaseNavigationController.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYBaseNavigationController.h"

@interface LYBaseNavigationController ()

@end

@implementation LYBaseNavigationController

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
        viewController.navigationItem.leftBarButtonItem = backButtonItem;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 返回按钮点击
- (void)backBarButtonClick {
    if (self.backSubject) {
        [self.backSubject sendNext:nil];
        [self.backSubject sendCompleted];
        self.backSubject = nil;
    }else {
        [self popViewControllerAnimated:YES];
    }
}

#pragma mark - lazy
- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, 0, 50, 40);
        [_backButton setImage:[UIImage imageNamed:@"backarrow_black"] forState:UIControlStateNormal];
        [_backButton setTitleColor:k999999Color forState:UIControlStateNormal];
        _backButton.titleLabel.font = kPingFangMediumFont(14);
        _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _backButton.adjustsImageWhenHighlighted = NO;
        [_backButton addTarget:self action:@selector(backBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}



@end
