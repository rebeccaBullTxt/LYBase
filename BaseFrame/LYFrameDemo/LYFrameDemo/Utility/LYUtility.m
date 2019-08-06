//
//  Utility.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "Utility.h"

@implementation Utility

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

+ (NSURL *)filePathWithName:(NSString *)fileName{
    NSURL *fileFolder = [Utility createFolderWithName:FILE_PATH inDirectory:[Utility dataPath]];
    if (!fileFolder) {
        return nil;
    }
    NSString *filePath = [[fileFolder absoluteString] stringByAppendingPathComponent:fileName];
    return [NSURL fileURLWithPath:filePath];
}
@end
