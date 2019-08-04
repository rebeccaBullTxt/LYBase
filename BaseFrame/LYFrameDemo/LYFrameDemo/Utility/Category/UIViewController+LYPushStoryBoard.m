//
//  UIViewController+LYPushStoryBoard.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/2.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "UIViewController+LYPushStoryBoard.h"

@implementation UIViewController (LYPushStoryBoard)

+ (instancetype)viewControllerWithStoryBoardType:(STORYBOARD_TYPE_)type {
    NSString *identifier = NSStringFromClass(self);
    UIStoryboard *storyboard;
    switch (type) {
        case STORYBOARD_TYPE_MAIN: {
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            break;
        }
        case STORYBOARD_TYPE_APPLICATION: {
            storyboard = [UIStoryboard storyboardWithName:@"Chat" bundle:nil];
            break;
        }
        case STORYBOARD_TYPE_PROFILE: {
            storyboard = [UIStoryboard storyboardWithName:@"AddressBook" bundle:nil];
            break;
        }
            break;
    }
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

@end
