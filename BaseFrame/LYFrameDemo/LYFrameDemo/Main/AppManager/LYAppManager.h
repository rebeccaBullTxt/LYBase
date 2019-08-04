//
//  LYAppManager.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/1.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYAppManager : NSObject

//userModel

//userToken

//userId






/**
 单例
 */
+ (instancetype)sharedManager;

/**
 登录页
 */
- (void)openLoginVc;


@end

NS_ASSUME_NONNULL_END
