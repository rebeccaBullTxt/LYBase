//
//  HTActionSheetModel.m
//  HanTalk
//
//  Created by 曹云霄 on 2018/4/16.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import "HTActionSheetModel.h"

@implementation HTActionSheetModel


+ (instancetype)title:(NSString *)title color:(UIColor *)color {
    return [[self alloc] initWithTitle:title color:color icon:nil];
}

+ (instancetype)title:(NSString *)title color:(UIColor *)color icon:(NSString *)icon {
    return [[self alloc] initWithTitle:title color:color icon:icon];
}

- (instancetype)initWithTitle:(NSString *)title color:(UIColor *)color icon:(NSString *)icon {
    if (self = [super init]) {
        self.title = title;
        self.color = color;
        self.iconName = icon;
        self.clickSubject = [RACSubject subject];
    }
    return self;
}
@end
