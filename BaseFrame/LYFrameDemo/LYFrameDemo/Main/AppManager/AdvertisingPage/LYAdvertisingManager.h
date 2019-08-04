//
//  LYAdvertisingManager.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/2.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHLaunchAd.h"

@interface LYAdvertisingManager : NSObject <XHLaunchAdDelegate>
+ (LYAdvertisingManager *)sharedManager;

@end
