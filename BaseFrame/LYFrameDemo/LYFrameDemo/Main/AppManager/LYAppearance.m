//
//  LYAppearance.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/1.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYAppearance.h"
@implementation LYAppearance

+ (void)customAppearance {
    [[self class] navigationAppearance];
    [[self class] tabbarAppearance];
}

#pragma mark -导航栏
+ (void)navigationAppearance {
    [UINavigationBar appearance].tintColor = kBlackColor;
    [UINavigationBar appearance].barTintColor = kWhiteColor;
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: kBlackColor,NSFontAttributeName: kPingFangMediumFont(18)}];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor colorWithHexRGB:@"#F0F0F0"] rect:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - Tabbar
+ (void)tabbarAppearance {
    [UITabBar appearance].translucent = NO;
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
}
@end
