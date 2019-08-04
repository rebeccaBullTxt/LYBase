//
//  UIViewController+LYPushStoryBoard.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/2.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LYPushStoryBoard)

+ (instancetype)viewControllerWithStoryBoardType:(STORYBOARD_TYPE_)type;

@end

NS_ASSUME_NONNULL_END
