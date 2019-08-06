//
//  LYLoginViewController.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/2.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYLoginViewController.h"
#import "LYLoginViewModel.h"
@interface LYLoginViewController ()

/**
 Logo图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *logoImg;

/**
 工号
 */
@property (weak, nonatomic) IBOutlet UITextField *workNumberText;
@property (weak, nonatomic) IBOutlet UIView *workNumberLineView;

/**
 密码
 */
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UIView *passwordLineView;


/**
 验证码
 */
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeText;
@property (weak, nonatomic) IBOutlet UIView *verificationCodeLineView;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UILabel *sendStatusLabel;

/**
 登录
 */
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

/**
 登录ViewModel
 */
@property (nonatomic, strong) LYLoginViewModel *loginViewModel;

@end

@implementation LYLoginViewController
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [IQKeyboardManager sharedManager].enable = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enable = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self uiConfigAction];
    [self bindingRacAction];
    [self loginButtonAction];
    [self addNotification];
}

#pragma mark - UI
- (void)uiConfigAction {
    self.workNumberText.autocorrectionType = UITextAutocorrectionTypeNo;
    self.workNumberText.spellCheckingType = UITextSpellCheckingTypeNo;
    self.passwordText.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordText.spellCheckingType = UITextSpellCheckingTypeNo;
    self.passwordText.secureTextEntry = YES;
    self.verificationCodeText.autocorrectionType = UITextAutocorrectionTypeNo;
    self.verificationCodeText.spellCheckingType = UITextSpellCheckingTypeNo;
    self.verificationCodeText.keyboardType = UIKeyboardTypeNumberPad;
    self.sendStatusLabel.font = kPingFangMediumFont(12);
    self.sendStatusLabel.textColor = k999999Color;
    self.sendStatusLabel.hidden = YES;
    self.sendBtn.titleLabel.font = kPingFangMediumFont(14);
    [self.sendBtn setTitle:SendVerificationCodeTitle forState:UIControlStateNormal];
    if (@available(iOS 12.0, *)) {
        self.verificationCodeText.textContentType = UITextContentTypeOneTimeCode;
    }
}

#pragma mark - 监听通知
- (void)addNotification {
    @weakify(self);
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        [self keyboardWillShow:x];
    }];
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillHideNotification object:nil] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        [self keyboardWillHidden:x];
    }];
//    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:kXhLaunchAdShowFinishNotification object:nil] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNotification * _Nullable x) {
//        [[Utility shared] locationAuthorization];
//    }];
}

#pragma mark - 键盘出现
- (void)keyboardWillShow:(NSNotification *)notification {
    if (self.view.y < 0) {
        return;
    }
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGFloat loginBtnBottom = ScreenSize.height - CGRectGetMaxY(self.loginButton.frame);
    [UIView animateWithDuration:duration animations:^{
        self.view.y = -(keyboardFrame.size.height - loginBtnBottom);
    }];
}

#pragma mark - 键盘消失
- (void)keyboardWillHidden:(NSNotification *)notification {
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.view.y = 0;
    }];
}

#pragma mark - 绑定RAC事件
- (void)bindingRacAction {
    RAC(self.loginViewModel.loginModel,username) = self.workNumberText.rac_textSignal;
    RAC(self.loginViewModel.loginModel,password) = self.passwordText.rac_textSignal;
    RAC(self.loginViewModel.loginModel,sms) = self.verificationCodeText.rac_textSignal;
    @weakify(self);
    [[[self.workNumberText rac_textSignal] map:^id _Nullable(NSString * _Nullable value) {
        if (![value empty]) {
            return kMainColor;
        }
        return kLightGrayColor;
    }] subscribeNext:^(UIColor *x) {
        @strongify(self);
        self.workNumberLineView.backgroundColor = x;
    }];
    
    [[[self.passwordText rac_textSignal] map:^id _Nullable(NSString * _Nullable value) {
        if (![value empty]) {
            return kMainColor;
        }
        return kLightGrayColor;
    }] subscribeNext:^(UIColor *x) {
        @strongify(self);
        self.passwordLineView.backgroundColor = x;
    }];
    
    [[[self.verificationCodeText rac_textSignal] map:^id _Nullable(NSString * _Nullable value) {
        if (![value empty]) {
            return kMainColor;
        }
        return kLightGrayColor;
    }] subscribeNext:^(UIColor *x) {
        @strongify(self);
        self.verificationCodeLineView.backgroundColor = x;
    }];
    
    [[self.loginViewModel.loginBtnEnableCmd.executionSignals switchToLatest] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        BOOL enabled = [x boolValue];
        self.loginButton.enabled = enabled;
    }];
    
    [[self.loginViewModel.sendBtnEnableCmd.executionSignals switchToLatest] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        BOOL enabled = [x boolValue];
        self.sendBtn.enabled = enabled;
        [self.sendBtn setTitleColor:enabled ? kMainColor : k999999Color forState:UIControlStateNormal];
    }];
    
    [[self.sendBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.view endEditing:YES];
        [self.sendBtn showIndicator];
        [self.loginViewModel.racForSend subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            [self.sendBtn hideIndicator];
            [self.verificationCodeText becomeFirstResponder];
//            HTVerificationCodeModel *model = [[HTVerificationCodeModel alloc] initWithDictionary:x error:nil];
//            self.sendStatusLabel.text = [NSString stringWithFormat:@"验证码已发送至手机号%@",model.data.tel];
            self.sendStatusLabel.text = [NSString stringWithFormat:@"验证码已发送至手机号"];
            self.sendStatusLabel.hidden = NO;
//            [self.sendBtn startWithTime:model.data.count_down.integerValue title:SendVerificationCodeTitle countDownTitle:@"s" mainColor:kMainColor countColor:k666666Color];
        } error:^(NSError * _Nullable error) {
            @strongify(self);
            [self.sendBtn hideIndicator];
            ShowMessage(kMessage(error));
        }];
    }];
    
    [[self.loginViewModel.loginActionCmd.executionSignals switchToLatest] subscribeNext:^(id  _Nullable x) {
//        if (KUSER_MODEL) {
//            [[LYAppManager sharedManager] openMainVc];
//        }
    }];
    
    [self.loginViewModel.loginActionCmd.errors subscribeNext:^(NSError * _Nullable x) {
        ShowMessage(kMessage(x));
    }];
}

#pragma mark - 登录
- (void)loginButtonAction {
    @weakify(self);
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.view endEditing:YES];
        [self.loginViewModel.loginActionCmd execute:nil];
    }];
}

#pragma mark - lazy
- (LYLoginViewModel *)loginViewModel {
    if (!_loginViewModel) {
        _loginViewModel = [[LYLoginViewModel alloc] init];
    }
    return _loginViewModel;
}


@end
