//
//  LYButton.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYButton.h"

@implementation LYButton

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (enabled) {
        //self.titleLabel.textColor = kWhiteColor;
        self.titleLabel.textColor = kBlackColor;
    }
    self.alpha = enabled ? 1 : 0.5;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
