//
//  LYAppManager.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/1.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYAppManager.h"
#import "LYAppearance.h"
#import "LYFrameWorkHelper.h"
#import "LYLoginViewController.h"
#import "LYTabBarController.h"

@implementation LYAppManager

+ (instancetype)sharedManager{
    static LYAppManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LYAppManager alloc] initAppManager];
    });
    return manager;
}

- (instancetype)initAppManager {
    self = [super init];
    if (self) {
        [LYAppearance customAppearance];
        [LYFrameWorkHelper startLoadThird];
        [self createSqliteTable];
        [self willResignActiveAction];
        [self didEnterBackGroundAction];
    }
    return self;
}

#pragma mark - 创建本地库
- (void)createSqliteTable{
    
}

#pragma mark -进入前台操作
- (void)willResignActiveAction{
    @weakify(self);
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        @strongify(self);
    }];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillEnterForegroundNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [Utility checkAppUpdate];
        });
    }];
}

#pragma mark - 进入后台操作
- (void)didEnterBackGroundAction{
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    }];
}
/*
 UIApplicationWillEnterForegroundNotification：只有回到前台，启动 app不算
 UIApplicationDidBecomeActiveNotification：回到前台 + 启动 app
 如果两条通知都监听，那么 UIApplicationWillEnterForegroundNotification 是要早于 UIApplicationDidBecomeActiveNotification
 */

#pragma mark - 更新个人信息
- (void)updateStaffSelfAction{
    
}

#pragma mark - 启动登录页
- (void)openLoginVc{
    //本地获取数据
    [self openMainVc];
    //未获取到数据,跳转至登录页
//    LYLoginViewController *loginVc = [LYLoginViewController viewControllerWithStoryBoardType:STORYBOARD_TYPE_MAIN];
//    kWindow.rootViewController = loginVc;
}

#pragma mark - BaseUrl
- (NSString *)baseUrl{
    //如果缓存中存在baseUrl 优先使用缓存 否则使用正式接口
//    if ([Utility getSandbox:kBaseUrlKey]) {
//        return [Utility getSandbox:kBaseUrlKey];
//    }else {
//        [Utility saveSandbox:BaseUrlReleae key:kBaseUrlKey];
//        return BaseUrlReleae;
//    }
    return @"";
}

- (void)loginOutAction{
    
}

#pragma mark - 主页
- (void)openMainVc {
    //设置HTTabBarController
    [self.customTabbar setViewControllers];
    kWindow.rootViewController = self.customTabbar;
    [kWindow makeKeyAndVisible];
}

#pragma mark - lazy
- (LYTabBarController *)customTabbar {
    if (!_customTabbar) {
        _customTabbar = [[LYTabBarController alloc] init];
    }
    return _customTabbar;
}

@end
