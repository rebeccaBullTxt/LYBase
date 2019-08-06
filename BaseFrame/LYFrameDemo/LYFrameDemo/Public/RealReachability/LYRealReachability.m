//
//  HTRealReachability.m
//  HanTalk
//
//  Created by 曹云霄 on 2018/12/20.
//  Copyright © 2018 上海韩创科技有限公司. All rights reserved.
//

#import "LYRealReachability.h"
#import "AFNetWorkUtils.h"

@implementation LYRealReachability


+ (instancetype)shareManager {
    static LYRealReachability *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LYRealReachability alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        GLobalRealReachability.hostForPing = @"www.baidu.com";
        GLobalRealReachability.hostForCheck = @"www.apple.com";
        GLobalRealReachability.autoCheckInterval = 1.0f;
        [GLobalRealReachability startNotifier];
        ReachabilityStatus status = [GLobalRealReachability currentReachabilityStatus];
        self.status = status;
        @weakify(self);
        [[[NSNotificationCenter defaultCenter] rac_addObserverForName:kRealReachabilityChangedNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
            @strongify(self);
            RealReachability *reachability= (RealReachability *)x.object;
            ReachabilityStatus status = [reachability currentReachabilityStatus];
            if (status == RealStatusUnknown || status == RealStatusNotReachable) {
                [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(networkCheckAction) object:nil];
                [self performSelector:@selector(networkCheckAction) withObject:nil afterDelay:30];
            }
            if (status == RealStatusViaWWAN || status == RealStatusViaWiFi) {
                //有网络
            }
        }];
    }
    return self;
}

#pragma mark - 网络校验
- (void)networkCheckAction {
    ReachabilityStatus status = [GLobalRealReachability currentReachabilityStatus];
    if (status == RealStatusUnknown || status == RealStatusNotReachable) {
        self.status = status;
    }
}


@end
