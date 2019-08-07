//
//  HTActionSheetManager.m
//  HanTalk
//
//  Created by 曹云霄 on 2018/4/16.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import "HTActionSheetManager.h"
#import "HTActionSheetViewController.h"


@interface HTActionSheetManager()

@property (nonatomic, strong) HTActionSheetViewController *actionSheetVc;

@end

@implementation HTActionSheetManager


+ (instancetype)sharedManager {
    static HTActionSheetManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HTActionSheetManager alloc] init];
    });
    return manager;
}

- (void)showActionSheetView:(NSArray<HTActionSheetModel *> *)array {
    [self.actionSheetVc showActionSheetView:array];
}

- (void)showActionSheetView:(NSArray<HTActionSheetModel *> *)array title:(NSString *)title {
    [self.actionSheetVc showActionSheetView:array title:title];
}

- (void)updateActionSheetView:(NSArray<HTActionSheetModel *> *)array title:(NSString *)title {
    [self.actionSheetVc updateActionSheetView:array title:title];
}

#pragma mark - lazy
- (HTActionSheetViewController *)actionSheetVc {
    if (!_actionSheetVc) {
        _actionSheetVc = [[HTActionSheetViewController alloc] init];
        _actionSheetVc.dismissSubject = [RACSubject subject];
        @weakify(self);
        [_actionSheetVc.dismissSubject subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            self->_actionSheetVc = nil;
        }];
    }
    return _actionSheetVc;
}
@end
