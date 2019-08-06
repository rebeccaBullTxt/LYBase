//
//  LYAdvertisingManager.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/2.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYAdvertisingManager.h"
@implementation LYAdvertisingManager 

+ (LYAdvertisingManager *)sharedManager {
    static LYAdvertisingManager *instance = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken,^{
        instance = [[LYAdvertisingManager alloc] init];
    });
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setupXHLaunchAd];
//        @weakify(self);
//        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
//            @strongify(self);
//        [self setupXHLaunchAd];
//        }];
    }
    return self;
}

#pragma mark - 开屏初始化
- (void)setupXHLaunchAd{
    NSString *advertising = [Utility getSandbox:kAdvertising];
    if (!advertising || [advertising empty]) {
        advertising = @"https://pic2.hanmaker.com/7f2abe4495a646c57686885f40fbae84f34f.jpg?imageslim";
    }
    if (advertising && ![advertising empty]) {
        [XHLaunchAd setLaunchSourceType:SourceTypeLaunchScreen];
        XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration new];
        imageAdconfiguration.duration = 3;
        imageAdconfiguration.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight * 0.85);
        imageAdconfiguration.imageNameOrURLString = [Utility generateUrl:advertising];
        imageAdconfiguration.contentMode = UIViewContentModeScaleToFill;
        imageAdconfiguration.imageOption = XHLaunchAdImageCacheInBackground;
        imageAdconfiguration.showFinishAnimate = ShowFinishAnimateNone;
        imageAdconfiguration.showFinishAnimateTime = 0.8;
        imageAdconfiguration.skipButtonType = SkipTypeText;
        imageAdconfiguration.showEnterForeground = NO;
        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
        [self getAdvertisingData];
    }else{
        [self getAdvertisingData];
    }
}

#pragma mark - 获取网络数据
- (void)getAdvertisingData{
//    [Utility saveSandbox:@"https://pic2.hanmaker.com/7f2abe4495a646c57686885f40fbae84f34f.jpg?imageslim" key:kAdvertising];
//    [Utility saveSandbox:model.data.url key:kAdvertisingUrl];
}

#pragma mark - <XHLaunchAdDelegate>
- (void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenModel:(id)openModel clickPoint:(CGPoint)clickPoint {
//    NSString *url = [Utility getSandbox:kAdvertisingUrl];
//    if ([url length] && [LYAppManager sharedManager].userModel) {
//        [XHLaunchAd removeAndAnimated:YES];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [[NSNotificationCenter defaultCenter] postNotificationName:kLaunchedClickNotification object:url];
//        });
//    }
}

-(void)xhLaunchAdShowFinish:(XHLaunchAd *)launchAd {
//    [[NSNotificationCenter defaultCenter] postNotificationName:kXhLaunchAdShowFinishNotification object:nil];
}
@end
