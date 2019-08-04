//
//  LYBaseNavigationController.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYBaseNavigationController : UINavigationController

@property (nonatomic, strong) UIButton *backButton;

/**
 返回按钮点击,需要的时候监听
 */
@property (nonatomic, strong) RACSubject *backSubject;

@end

