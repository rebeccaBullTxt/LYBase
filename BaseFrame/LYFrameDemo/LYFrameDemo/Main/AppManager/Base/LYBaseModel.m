//
//  LYBaseModel.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYBaseModel.h"

@implementation LYBaseModel

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"_id": @"id",@"_description": @"description",@"_register": @"register",@"_class":@"class",@"_version": @"new_version",@"_presentversion": @"version",@"__id": @"_id"}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
