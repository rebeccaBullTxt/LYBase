//
//  HTRealReachability.h
//  HanTalk
//
//  Created by 曹云霄 on 2018/12/20.
//  Copyright © 2018 上海韩创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RealReachability.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYRealReachability : NSObject


+ (instancetype)shareManager;

/**
 网络状态
 RealStatusUnknown = -1,未知
 RealStatusNotReachable = 0,无网络连接
 RealStatusViaWWAN = 1,流量
 RealStatusViaWiFi = 2  WiFi
 */
@property (nonatomic, assign) ReachabilityStatus status;

@end

NS_ASSUME_NONNULL_END
