//
//  LYBaseViewController.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYBaseViewController : UIViewController

/**
 监听通知
 */
- (void)monitorNotification;

/**
 设置导航栏标题
 
 @param title 标题
 @param subTitle 子标题,如果为nil，标题字体大小18，否则为20
 */
- (void)setupTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end

NS_ASSUME_NONNULL_END
