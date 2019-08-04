//
//  UIView+Helper.m
//  HanTalk
//
//  Created by 曹云霄 on 2018/3/26.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView (Helper)

+ (instancetype)initializeXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}
- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}


/**
 UIView CATransition 动画

 @param type 动画类型
         Fade,                       淡入淡出
         Push,                       推挤
         Reveal,                     揭开
         MoveIn,                     覆盖
         Cube,                       立方体
         SuckEffect,                 吮吸
         OglFlip,                    翻转
         RippleEffect,               波纹
         PageCurl,                   翻页
         PageUnCurl,                 反翻页
         CameraIrisHollowOpen,       开镜头
         CameraIrisHollowClose,      关镜头
 @param duration 动画时间
 @param subtype 动画方向
         kCATransitionFromLeft
         kCATransitionFromBottom
         kCATransitionFromRight
         kCATransitionFromTop
 
 */
- (void)transitionAnimation:(NSString *)type duration:(CFTimeInterval)duration subtype:(NSString *)subtype {
    CATransition *animation = [CATransition animation];
    animation.duration = duration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = type;
    animation.subtype = subtype;
    [self.window.layer addAnimation:animation forKey:nil];
    
}






















@end
