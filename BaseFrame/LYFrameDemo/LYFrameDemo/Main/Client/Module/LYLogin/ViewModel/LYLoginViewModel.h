//
//  LYLoginViewModel.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/5.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYLoginModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LYLoginViewModel : NSObject

@property (nonatomic, strong) LYLoginModel *loginModel;
@property (nonatomic,strong) RACCommand *loginBtnEnableCmd;
@property (nonatomic,strong) RACCommand *loginActionCmd;
@property (nonatomic,strong) RACCommand *sendBtnEnableCmd;

/**
 发送验证码
 
 @return RACSignal
 */
- (RACSignal *)racForSend;

@end

NS_ASSUME_NONNULL_END
