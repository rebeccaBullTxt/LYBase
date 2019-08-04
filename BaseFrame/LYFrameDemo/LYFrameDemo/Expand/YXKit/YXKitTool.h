//
//  YXKitTool.h
//  YXKitDemo
//
//  Created by 曹云霄 on 2017/6/30.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#ifndef YXKitTool_h
#define YXKitTool_h


/**
 *  Documents路径
 */
#define kPathDocument  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) yx_objectAtIndex:0]

/**
 *  caches路径
 */
#define kPathCaches  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) yx_objectAtIndex:0]

/**
 *  NSLibraryDirectory路径
 */
#define kPathLibiary  [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) yx_objectAtIndex:0]
/**
 *  本地 Bundle路径
 */
#define kPathBundle [[NSBundle mainBundle]pathForResource:@"Hantalk" ofType:@"bundle"]
/**
 *  本地 文件路径 fileName完成名称 要加类型(如xx.gif)
 */
#define kPathFile(fileName) [kPathBundle stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",fileName]]

/**
 * 读取本地图片路径
 */
#define LOADIMAGE(fileName) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:nil]]

/*
 * Clog
 */
#ifdef DEBUG
#define CLog(format, ...) HTLog((@"[Line %d] %s " format), __LINE__, __PRETTY_FUNCTION__, ## __VA_ARGS__)
#else
#define CLog(format, ...)
#endif

/**
 *  RGB颜色
 */
#define RGBA(R,G,B,A)   [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

/**
 *  字体大小
 */
#define FontSize(num)    [UIFont systemFontOfSize:num]

/**
 *  keyWindow
 */
#define AppWindow      [[UIApplication sharedApplication].delegate window]

/**
 *  物理屏幕Size
 */
#define ScreenSize       ([[UIScreen mainScreen] bounds].size)
#define ScreenHeight     ([UIScreen mainScreen].bounds.size.height)
#define ScreenWidth      ([UIScreen mainScreen].bounds.size.width)

/**
 *  设备信息
 */
#define Device          [UIDevice currentDevice]

#endif /* YXKitTool_h */
