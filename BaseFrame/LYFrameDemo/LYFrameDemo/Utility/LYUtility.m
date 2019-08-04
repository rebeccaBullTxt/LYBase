//
//  LYUtility.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYUtility.h"

@implementation LYUtility

#pragma mark - user default functions
+ (void)saveSandbox:(id)value key:(NSString *)key{
    if ( key != nil ) {
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (id)getSandbox:(NSString *)key{
    if (key == nil) {
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)removeSandbox:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)generateUrl:(NSString *)string{
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                    (CFStringRef)string,
                                                                                                    (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                                                    NULL,
                                                                                                    kCFStringEncodingUTF8));
    return encodedString;
}

@end
