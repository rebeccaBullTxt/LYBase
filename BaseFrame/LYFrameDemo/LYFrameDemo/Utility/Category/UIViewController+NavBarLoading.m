//
//  UIViewController+NavBarLoading
//  HanTalk
//
//  Created by 曹云霄 on 2018/3/29.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import "UIViewController+NavBarLoading.h"
#import <objc/runtime.h>

#define UNUNITED @"(未连接)"

@implementation UIViewController (NavBarLoading)

static char NavBarOrigTitleKey;
- (void)setNavBarOrigTitle:(NSString *)navBarOrigTitle {
    objc_setAssociatedObject(self, &NavBarOrigTitleKey, navBarOrigTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)navBarOrigTitle {
    return objc_getAssociatedObject(self, &NavBarOrigTitleKey);
}

static char NavBarIsLoadingKey;
- (void)setIsLoading:(BOOL)isLoading {
    objc_setAssociatedObject(self, &NavBarIsLoadingKey, @(isLoading), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isLoading {
    return [objc_getAssociatedObject(self, &NavBarIsLoadingKey) boolValue];
}

- (void)startLoading:(HTConnectState)type {
    if (!self.isLoading) {
        self.isLoading = YES;
        if ([self.navigationItem.title containString:UNUNITED]) {
            return;
        }
        self.navBarOrigTitle = self.navigationItem.title;
        UIView *navBarLoadingContainer = [[UIView alloc] initWithFrame:CGRectMake((ScreenWidth - 100) / 2, 2, 100, 40)];
        self.navigationItem.titleView = navBarLoadingContainer;
        
        UILabel *loadingTitleLabel = [[UILabel alloc] init];
        loadingTitleLabel.textAlignment = NSTextAlignmentCenter;
        loadingTitleLabel.textColor = [UIColor blackColor];
        loadingTitleLabel.font = [UIFont boldSystemFontOfSize:18];
        NSString *title;
        switch (type) {
            case HTLoading: {
                title = @"收取中...";
            }
                break;
            case HTConnecting: {
                title = @"连接中...";
            }
                break;
            default:
                break;
        }
        loadingTitleLabel.text = title;
        
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [activityIndicator startAnimating];
        [navBarLoadingContainer addSubview:loadingTitleLabel];
        [navBarLoadingContainer addSubview:activityIndicator];
        
        [loadingTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(navBarLoadingContainer);
            make.centerX.equalTo(navBarLoadingContainer).mas_offset(10);
        }];
        [loadingTitleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [activityIndicator mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(loadingTitleLabel);
            make.right.equalTo(loadingTitleLabel.mas_left).mas_offset(-5);
        }];
    }
}

- (void)stopLoading:(HTConnectState)type {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.navigationItem.titleView = nil;
        NSString *string = UNUNITED;
        NSString *navBarOrigTitle = self.navBarOrigTitle;
        if (type == HTDisconnect) {
            if (![navBarOrigTitle containString:string]) {
                navBarOrigTitle = [NSString stringWithFormat:@"%@%@",navBarOrigTitle,string];
            }
        }else if (type == HTConnected) {
            if ([navBarOrigTitle containString:string]) {
                navBarOrigTitle = [navBarOrigTitle stringByReplacingOccurrencesOfString:string withString:@""];
            }
        }
        if (!navBarOrigTitle) {
            navBarOrigTitle = @"消息";
        }
        self.navBarOrigTitle = navBarOrigTitle;
        self.navigationItem.title = navBarOrigTitle;
        self.isLoading = NO;
    });
}

















@end
