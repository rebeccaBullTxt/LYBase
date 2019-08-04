//
//  UIImage+LYHelper.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/3.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LYHelper)

+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect;

/**
 根据颜色生成图片
 
 @param color 颜色
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
