//
//  Enumeration.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/1.
//  Copyright © 2019 刘渊. All rights reserved.
//

#ifndef Enumeration_h
#define Enumeration_h

/**
 群助手类型
 
 - HTGroupHelperTypeNone: 群助手类型
 - HTGroupGroupType: 群分组类型
 */
typedef NS_ENUM(NSInteger, HTGroupHelperType) {
    HTGroupHelperTypeNone= 0,
    HTGroupGroupType,
};

/**
 StoryBoard类型
 
 - STORYBOARD_TYPE_MAIN:          主页
 - STORYBOARD_TYPE_APPLICATION:   社区
 - STORYBOARD_TYPE_PROFILE:       个人
 */
typedef NS_ENUM(NSInteger, STORYBOARD_TYPE_) {
    STORYBOARD_TYPE_MAIN,
    STORYBOARD_TYPE_APPLICATION,
    STORYBOARD_TYPE_PROFILE
};

/**
 导航栏显示状态
 
 - HTConnecting: socket连接中
 - HTConnected: socket连接成功
 - HTDisconnect: socket连接失败
 - HTLoading: 加载中
 - HTLoaded: 加载成功
 */
typedef NS_ENUM(NSInteger,HTConnectState) {
    HTConnecting = 0,
    HTConnected,
    HTDisconnect,
    HTLoading,
    HTLoaded
};

/**
 数据加载类型
 
 - Loading: 加载中
 - LoadSuccess: 加载成功
 - LoadNotData: 加载成功无数据
 - LoadError: 加载失败
 - LoadTimeOut: 加载超时
 */
typedef NS_ENUM(NSInteger, LoadType) {
    Loading = 0,
    LoadSuccess,
    LoadNotData,
    LoadError,
    LoadTimeOut
};

/**
 结束刷新类型
 
 - EndRefreshDefault: 默认结束
 - EndRefreshNotData: 无数据结束
 */
typedef NS_ENUM(NSInteger,EndRefreshType) {
    EndRefreshDefault = 0,
    EndRefreshNotData
};



#endif /* Enumeration_h */
