//
//  UIView+Helper.h
//  HanTalk
//
//  Created by 曹云霄 on 2018/3/26.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Helper)


+ (instancetype)initializeXib;

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable UIColor *borderColor;


#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;



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
- (void)transitionAnimation:(NSString *)type duration:(CFTimeInterval)duration subtype:(NSString *)subtype;


@end
