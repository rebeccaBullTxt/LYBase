//
//  HTActionSheetModel.h
//  HanTalk
//
//  Created by 曹云霄 on 2018/4/16.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTActionSheetModel : NSObject

+ (instancetype)title:(NSString *)title color:(UIColor *)color;
+ (instancetype)title:(NSString *)title color:(UIColor *)color icon:(NSString *)icon;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) UIColor *color;
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, strong) RACSubject *clickSubject;
@end
