//
//  UIViewController+NavBarLoading
//  HanTalk
//
//  Created by 曹云霄 on 2018/3/29.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//
#import <UIKit/UIKit.h>


@interface UIViewController (NavBarLoading)

@property (copy, nonatomic) NSString *navBarOrigTitle;
@property (assign, nonatomic) BOOL isLoading;


/**
 加载中

 @param type 加载状态
 */
- (void)startLoading:(HTConnectState)type;

/**
 停止加载
 */
- (void)stopLoading:(HTConnectState)type;

@end
