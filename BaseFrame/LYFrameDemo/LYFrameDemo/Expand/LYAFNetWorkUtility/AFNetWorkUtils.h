//
//  AFNetWorkUtils.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/5.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
static NSString *const errorInfoKey = @"errorInfoKey";

@interface NSErrorHelper : NSObject

+ (NSError *)createErrorWithUserInfo:(NSDictionary *)userInfo domain:(NSString *)domain code:(NSInteger)code;

@end


@interface AFNetWorkUtils : NSObject

/**
 单例模式
 
 @return AFNetWorkUtils
 */
+ (instancetype)sharedManager;

@end

