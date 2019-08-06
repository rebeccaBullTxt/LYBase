//
//  AppDelegate.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/1.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "AppDelegate.h"
#import "LYAdvertisingManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = kWhiteColor;
    [self.window makeKeyAndVisible];
    [[LYAppManager sharedManager] openLoginVc];
    [LYAdvertisingManager sharedManager];
    return YES;
}

@end
