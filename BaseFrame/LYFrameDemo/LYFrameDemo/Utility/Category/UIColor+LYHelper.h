//
//  UIColor+Helper.h
//  HanTalk
//
//  Created by 刘渊 on 2019/8/3.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LYHelper)


/**
 加载16进制颜色
 */
+ (instancetype)colorWithHexRGB:(NSString *)rgba;
+ (instancetype)colorWithHexRGB:(NSString *)rgb alpha:(CGFloat)alpha;

/**
 * 随机颜色
 */
+ (UIColor *)randomColor;

+ (UIColor *)ColorWithR:(int)r withG:(int)g withB:(int)b;
@end
