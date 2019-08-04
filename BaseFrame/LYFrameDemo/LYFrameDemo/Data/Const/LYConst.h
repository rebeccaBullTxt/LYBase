//
//  LYConst.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/1.
//  Copyright © 2019 刘渊. All rights reserved.
//

//error 明细
#define kMessage(obj) obj.userInfo[errorInfoKey]
//error Code码
#define kMessageCode(obj) obj.code
//全局统一字体
#define kPingFangRegularFont(s) [UIFont fontWithName:@"PingFang-SC-Regular" size:s]
#define kPingFangMediumFont(s) [UIFont fontWithName:@"PingFang-SC-Medium" size:s]
#define kSystemFont(s) [UIFont systemFontOfSize:s]

//AppDelegate
#define kAppDelegate [UIApplication sharedApplication].delegate

#define kZero 0


//高度相关
#define kNavigationH 64
#define kCategoryViewHeight 44
#define INPUTVIEW_TOOL_HEIGHT 95
#define kBoomTarHeight 45
#define INPUTVIEW_PUBLIC_HEIGHT 50

#define kTableBarH 49
#define kHeaderSectionH 7
#define kFooterSectionH 0.01
#define kZero 0
//iPhoneX 相关
#define IPHONEX_STATUSBAR_HEIGHT 44
#define IPHONEX_TABBAR_HEIGHT 83
#define IPHONEX_NAVIGATIONBAR_HEIGHT 88
#define IPHONEX_INDICATOR_HEIGHT 34
#define isIPhoneXAll ([[UIApplication sharedApplication] statusBarFrame].size.height == 44)
//iphone真实导航栏
#define IPHONE_NAVIGATION_HEIGHT (isIPhoneXAll ? IPHONEX_NAVIGATIONBAR_HEIGHT : kNavigationH)
//iphone真实底部安全距离
#define IPHONE_BOTTOMSAFEAREA    (isIPhoneXAll ? IPHONEX_INDICATOR_HEIGHT : kZero)
//iphone真实状态栏高度
#define IPHONE_STATUSBARHEIHGT (isIPhoneXAll ? IPHONEX_STATUSBAR_HEIGHT : 20)

//Window
#define kWindow [[[UIApplication sharedApplication] delegate] window]

#ifdef DEBUG
# define LYLog(fmt, ...) NSLog((fmt @"\n[函数名:%s]\n" "[行号:%d] \n"),##__VA_ARGS__, __FUNCTION__, __LINE__);
#else
# define LYLog(...);
#endif
