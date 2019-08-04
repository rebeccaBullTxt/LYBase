//
//  LYFrameWorkHelper.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/2.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYFrameWorkHelper.h"
//#import "IQKeyboardManager.h"
//#import "HTUploadManager.h"
//#import "RealReachability.h"
//#import "MyCrashHandler.h"
//#import <CoreLocation/CoreLocation.h>
//#import "YYWebImage.h"
//#import <Bugly/Bugly.h>
//#import "AvoidCrash.h"
@implementation LYFrameWorkHelper

+ (void)startLoadThird {
    [[self class] setKeyboard];
    [[self class] setDefaultMyCrashHandle];
    [[self class] setSDWebImageDownloader];
    [[self class] setBugly];
    [[self class] setAvoidCrash];
}

#pragma mark - 键盘
+ (void)setKeyboard {
//    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
//    [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:0];
//    manager.previousNextDisplayMode = IQPreviousNextDisplayModeAlwaysHide;
//    manager.enable = YES;
//    manager.shouldResignOnTouchOutside = YES;
//    manager.enableAutoToolbar = NO;
//    manager.toolbarTintColor = kMainColor;
}

#pragma mark - 开启异常捕获
+ (void)setDefaultMyCrashHandle{
//    [MyCrashHandler setDefaultHandler];
}

#pragma mark - 开启Bugly异常检测
+ (void)setBugly {
#ifdef DEBUG
#else
//    BuglyConfig *config = [BuglyConfig new];
//    config.blockMonitorEnable = YES;
//    [Bugly startWithAppId:Bugly_APP_ID config:config];
#endif
}

#pragma mark - 设置七牛云资源防盗链
+ (void)setSDWebImageDownloader {
//    SDWebImageDownloader *manager = [SDWebImageManager sharedManager].imageDownloader;
//    manager.headersFilter = ^SDHTTPHeadersDictionary * _Nullable(NSURL * _Nullable url, SDHTTPHeadersDictionary * _Nullable headers) {
//        return @{@"Referer": RefererValue};
//    };
//    YYWebImageManager *yyManager = [YYWebImageManager sharedManager];
//    yyManager.headersFilter = ^NSDictionary<NSString *,NSString *> * _Nonnull(NSURL * _Nonnull url, NSDictionary<NSString *,NSString *> * _Nullable header) {
//        return @{@"Referer": RefererValue};
//    };
}

#pragma mark - 基础防崩溃处理
+ (void)setAvoidCrash {
//    [AvoidCrash makeAllEffective];
}

@end
