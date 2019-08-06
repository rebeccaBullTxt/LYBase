//
//  Utility.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utility : NSObject

/**
 保存沙盒
 
 @param value value
 @param key key
 */
+ (void)saveSandbox:(id)value key:(NSString *)key;

/**
 沙盒中读取
 
 @param key key
 @return value
 */
+ (id)getSandbox:(NSString *)key;

/**
 删除沙盒内容
 
 @param key key
 */
+ (void)removeSandbox:(NSString *)key;

/**
 url中文和特殊字符转码###

 @param string 地址
 @return NSString
 */
+ (NSString *)generateUrl:(NSString *)string;


/**
 创建文件路径
 
 @param fileName 文件名
 @return URL
 */
+ (NSURL *)filePathWithName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
