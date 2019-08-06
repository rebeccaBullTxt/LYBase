//
//  Utility+File.h
//  LLWeChat
//
//  Created by GYJZH on 9/10/16.
//  Copyright © 2016 GYJZH. All rights reserved.
//

#import "Utility.h"
#import <UIKit/UIKit.h>


@interface Utility (File)

+ (NSString *)homeDirectory;

+ (NSString *)documentDirectory;

+ (NSString *)cacheDirectory;

+ (NSString *)tmpDirectory;

+ (NSURL *)createFolderWithName:(NSString *)folderName inDirectory:(NSString *)directory;

+ (NSString *)dataPath;

+ (void)removeFileAtPath:(NSString *)path;

+ (void)writeImageAtPath:(NSString *)path image:(UIImage *)image proportion:(CGFloat)proportion;

/**
 *  返回文件大小，单位为字节
 */
+ (unsigned long long)getFileSize:(NSString *)path;

@end
