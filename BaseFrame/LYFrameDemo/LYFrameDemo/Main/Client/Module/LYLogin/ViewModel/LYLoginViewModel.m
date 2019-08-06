//
//  LYLoginViewModel.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/5.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYLoginViewModel.h"
#import "LYLoginModel.h"

@implementation LYLoginViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self setCommandAction];
        [self setSubscribeAction];
    }
    return self;
}

- (void)setCommandAction {
    @weakify(self);
    self.loginBtnEnableCmd = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self racForSubmitEnable];
    }];
    self.loginActionCmd = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        return [self racForLogin];
    }];
    self.sendBtnEnableCmd = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        return [self racForSendEnable];
    }];
}

#pragma mark - 校验登录按钮的状态
- (RACSignal *)racForSubmitEnable {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        BOOL status = self.loginModel.username.length >= 3 && self.loginModel.password.length >= 3 && self.loginModel.sms.length >= 3;
        [subscriber sendNext:@(status)];
        [subscriber sendCompleted];
        return nil;
    }];
}

#pragma mark - 登录操作
- (RACSignal *)racForLogin {
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
//        NSString *url = Login;
//        if ([self.loginModel.username isEqualToString:@"hc544"] || [self.loginModel.username isEqualToString:@"s1680"] || [self.loginModel.username isEqualToString:@"s830"] || [self.loginModel.username isEqualToString:@"hc1148"]  || [self.loginModel.username isEqualToString:@"s1204"]) {
//            //为了测试方便，过滤一些账号，走老接口 不需要验证码
//            url = LoginOld;
//        }
//        ShowGifDefaultLoadingView();
//        [[AFNetWorkUtils racPOSTWthURL:url params:self.loginModel.toDictionary] subscribeNext:^(id  _Nullable x) {
//            @strongify(self);
//            KUSER_TOKEN = x[@"data"][@"HC_ACCESS_TOKEN"];
//            [[self getUserConfigInformation] subscribeError:^(NSError * _Nullable error) {
//                DismissDefaultHud();
//                [subscriber sendError:error];
//            } completed:^{
//                DismissDefaultHud();
//                [subscriber sendNext:nil];
//                [subscriber sendCompleted];
//            }];
//        } error:^(NSError * _Nullable error) {
//            DismissDefaultHud();
//            [subscriber sendError:error];
//        }];
        return nil;
    }];
}

#pragma mark - 校验发送验证码按钮的状态
- (RACSignal *)racForSendEnable {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        BOOL status = self.loginModel.username.length >= 3 && self.loginModel.password.length >= 3;
        [subscriber sendNext:@(status)];
        [subscriber sendCompleted];
        return nil;
    }];
}

#pragma mark - 双向绑定
- (void)setSubscribeAction {
    @weakify(self);
    [RACObserve(self.loginModel, username) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.loginBtnEnableCmd execute:nil];
        [self.sendBtnEnableCmd execute:nil];
    }];
    [RACObserve(self.loginModel, password) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.loginBtnEnableCmd execute:nil];
        [self.sendBtnEnableCmd execute:nil];
    }];
    [RACObserve(self.loginModel, sms) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.loginBtnEnableCmd execute:nil];
    }];
}

#pragma mark - 发送验证码
- (RACSignal *)racForSend {
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
//        [[AFNetWorkUtils racPOSTWthURL:PostSendSms params:self.loginModel.toDictionary] subscribeNext:^(id  _Nullable x) {
//            [subscriber sendNext:x];
//            [subscriber sendCompleted];
//        } error:^(NSError * _Nullable error) {
//            [subscriber sendError:error];
//        }];
        return nil;
    }];
}

#pragma mark - lazy
- (LYLoginModel *)loginModel{
    if (!_loginModel) {
        _loginModel = [[LYLoginModel alloc] init];
    }
    return _loginModel;
}

@end
