//
//  HTActionSheetViewController.h
//  HanTalk
//
//  Created by 曹云霄 on 2018/4/16.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTActionSheetModel.h"

@interface HTActionSheetViewController : UIViewController

@property (nonatomic, strong) RACSubject *dismissSubject;


- (void)showActionSheetView:(NSArray<HTActionSheetModel *> *)array;
- (void)showActionSheetView:(NSArray<HTActionSheetModel *> *)array title:(NSString *)title;
- (void)updateActionSheetView:(NSArray<HTActionSheetModel *> *)array title:(NSString *)title;
@end
