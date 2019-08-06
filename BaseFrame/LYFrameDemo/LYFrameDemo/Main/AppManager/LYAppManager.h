//
//  LYAppManager.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/1.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYTabBarController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYAppManager : NSObject

//userModel

//userId

//userToken
@property (nonatomic, copy) NSString *userToken;

@property (nonatomic, strong) LYTabBarController *customTabbar;



/**
 单例
 */
+ (instancetype)sharedManager;

/**
 登录页
 */
- (void)openLoginVc;

/**
 打开主页
 */
- (void)openMainVc;

/**
 获取baseUrl
 */
- (NSString *)baseUrl;

/**
 退出登录
 */
- (void)loginOutAction;

@end

NS_ASSUME_NONNULL_END
