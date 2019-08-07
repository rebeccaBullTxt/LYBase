//
//  HTActionSheetManager.h
//  HanTalk
//
//  Created by 曹云霄 on 2018/4/16.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTActionSheetModel.h"

@interface HTActionSheetManager : NSObject

+ (instancetype)sharedManager;


/**
 ActionSheet数据,默认会在后面添加取消
 @param array NSarray
 */
- (void)showActionSheetView:(NSArray <HTActionSheetModel *> *)array;

/**
 ActionSheet数据,默认会在后面添加取消
 @param array NSarray
 @param title s标题
 */
- (void)showActionSheetView:(NSArray<HTActionSheetModel *> *)array title:(NSString *)title;

/**
 更新 ActionSheet数据,默认会在后面添加取消
 @param array NSarray
 @param title s标题
 */
- (void)updateActionSheetView:(NSArray<HTActionSheetModel *> *)array title:(NSString *)title;


@end
