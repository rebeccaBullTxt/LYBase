//
//  Utility+File.m
//  LLWeChat
//
//  Created by GYJZH on 9/10/16.
//  Copyright © 2016 GYJZH. All rights reserved.
//

#import "Utility+File.h"


@implementation Utility (File)

+ (NSString *)homeDirectory {
    return NSHomeDirectory();
}

+ (NSString *)documentDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths yx_objectAtIndex:0];
    
    return docDir;
}

+ (NSString *)cacheDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths yx_objectAtIndex:0];
    
    return cachesDir;
}

+ (NSString *)tmpDirectory {
    NSString *tmpDir = NSTemporaryDirectory();
    return tmpDir;
}

+ (NSURL *)createFolderWithName:(NSString *)folderName inDirectory:(NSString *)directory {
    NSString *path = [directory stringByAppendingPathComponent:folderName];
    NSURL *folderURL = [NSURL URLWithString:path];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:path]) {
        NSError *error;
        [fileManager createDirectoryAtPath:path
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:&error];
        if (!error) {
            return folderURL;
        }else {
            LYLog(@"创建文件失败 %@", error.localizedFailureReason);
            return nil;
        }
    }
    return folderURL;
}


+ (NSString*)dataPath {
    static NSString *_dataPath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dataPath = [NSString stringWithFormat:@"%@/Library/appdata/chatbuffer", NSHomeDirectory()];
    });
    
    NSFileManager *fm = [NSFileManager defaultManager];
    if(![fm fileExistsAtPath:_dataPath]){
        [fm createDirectoryAtPath:_dataPath
      withIntermediateDirectories:YES
                       attributes:nil
                            error:nil];
    }
    
    return _dataPath;
}


+ (void)removeFileAtPath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSError *error = nil;
        [fileManager removeItemAtPath:path error:&error];
        if (error) {
            LYLog(@"failed to remove file, error:%@.", error);
        }
    }
}

+ (void)writeImageAtPath:(NSString *)path image:(UIImage *)image proportion:(CGFloat)proportion {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:path contents:UIImageJPEGRepresentation(image, proportion) attributes:nil];
}


+ (unsigned long long)getFileSize:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    unsigned long long fileSize = 0;
    if ([fileManager fileExistsAtPath:path]) {
        NSDictionary *fileDic = [fileManager attributesOfItemAtPath:path error:nil];//获取文件的属性
        fileSize = [[fileDic objectForKey:NSFileSize] longLongValue];
    }
    return fileSize;
}



@end
