//
//  LYLoginModel.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/5.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYBaseModel.h"

@interface LYLoginModel : LYBaseModel

/**
 用户名
 */
@property (nonatomic, copy) NSString *username;

/**
 密码
 */
@property (nonatomic, copy) NSString *password;

/**
 验证码
 */
@property (nonatomic, copy) NSString *sms;

@end
