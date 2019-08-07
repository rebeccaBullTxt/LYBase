//
//  LYWCDBManager.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/7.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYWCDBManager.h"
#import <WCDB/WCDB.h>

@interface LYWCDBManager()

@property (nonatomic, strong) WCTDatabase *database;

@end

@implementation LYWCDBManager

+ (instancetype)shared
{
    static LYWCDBManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LYWCDBManager alloc] init];
        [manager initializeDataBase];
    });
    return manager;
}

/**
 初始化数据库
 */
- (void)initializeDataBase {
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"LYCache.sqlite"];
    LYLog(@"DataBaseFilePath = %@",filePath);
    WCTDatabase *database = [[WCTDatabase alloc]initWithPath:filePath];
    self.database = database;
}

/**
 新建表，如果不存在的话
 
 @param tableName 表名
 @param cls       映射类
 @return          是否成功
 */
- (BOOL)createTableOfName:(NSString *)tableName withClass:(Class<WCTTableCoding>)cls {
    if ([self.database canOpen]) {
        if ([self.database isOpened]) {
            return [self.database createTableAndIndexesOfName:tableName withClass:cls];
        }
    }
    return NO;
}

/**
 插入数据
 
 @param objects NSArray<WCTObject *>
 @param tableName 表名
 @return 是否成功
 */
- (BOOL)insertObjects:(NSArray<WCTObject *> *)objects into:(NSString *)tableName {
    return [self.database insertObjects:objects into:tableName];
}

/**
 替换数据
 
 @param objects NSArray<WCTObject *>
 @param tableName 表名
 @return 是否成功
 */
- (BOOL)insertOrReplaceObjects:(NSArray<WCTObject *> *)objects into:(NSString *)tableName {
    return [self.database insertOrReplaceObjects:objects into:tableName];
}

@end
