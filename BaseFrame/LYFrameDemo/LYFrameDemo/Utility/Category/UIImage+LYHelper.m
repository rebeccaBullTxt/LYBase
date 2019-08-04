//
//  UIImage+LYHelper.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/3.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "UIImage+LYHelper.h"

@implementation UIImage (LYHelper)

/**
 根据颜色和CGRect生成图片
 
 @param color UIColor
 @param rect CGRect
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 根据颜色生成图片

 @param color 颜色
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
