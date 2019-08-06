//
//  YXProgressHUDView.m
//  Framework
//
//  Created by 曹云霄 on 2017/1/22.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#import "YXProgressHUDView.h"
#import "UIImage+GIF.h"
@implementation YXProgressHUDView

/**
 初始化
 */
MBProgressHUD* baseHUDView(UIView *view){
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationFade;
    hud.contentColor = HUDContentColor;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    hud.margin = 10;
    hud.minSize = HUDContentSize;
    hud.minShowTime = 0.2;
    hud.removeFromSuperViewOnHide = YES;
    hud.label.font = [UIFont boldSystemFontOfSize:15];
    hud.label.numberOfLines = 0;
    return hud;
}


/**
 文本提示框
 
 @param message message
 */
void ShowMessage(NSString *message) {
    if (!message) {
        return;
    }
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            hud.label.text = message;
            hud.minSize = CGSizeZero;
            hud.margin = 10;
            hud.minShowTime = 2;
            hud.mode = MBProgressHUDModeText;
            hud.offset = CGPointMake(0, 0);
            [hud hideAnimated:YES afterDelay:HUDShowTime];
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        hud.label.text = message;
        hud.minSize = CGSizeZero;
        hud.margin = 10;
        hud.minShowTime = 2;
        hud.mode = MBProgressHUDModeText;
        hud.offset = CGPointMake(0, 0);
        [hud hideAnimated:YES afterDelay:HUDShowTime];
    }
}

/**
 文本提示框
 
 @param message message
 */
void ShowCustomMessage(UIView *view,NSString *message) {
    if (!message) {
        return;
    }
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(view);
            hud.label.text = message;
            hud.minSize = CGSizeZero;
            hud.margin = 10;
            hud.minShowTime = 2;
            hud.mode = MBProgressHUDModeText;
            [hud hideAnimated:YES afterDelay:HUDShowTime];
        });
    }else{
        MBProgressHUD *hud = baseHUDView(view);
        hud.label.text = message;
        hud.minSize = CGSizeZero;
        hud.margin = 10;
        hud.minShowTime = 2;
        hud.mode = MBProgressHUDModeText;
        [hud hideAnimated:YES afterDelay:HUDShowTime];
    }
}


/**
 持续加载框
 默认窗口
 
 @param message 提示信息
 */
void ShowDefaultLoadingView(NSString *message) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            hud.label.text = message;
            hud.mode = MBProgressHUDModeIndeterminate;
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        hud.label.text = message;
        hud.mode = MBProgressHUDModeIndeterminate;
    }
}

/**
 Gif持续加载框(直接放在window上,不能进行其他操作)
 */
void ShowGifDefaultLoadingView() {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:kPathFile(@"webgif.gif")]];
            imageView.image = [UIImage sd_imageWithGIFData:data];
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = imageView;
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.bezelView.layer.shadowColor = [UIColor blackColor].CGColor;
            hud.layer.shadowOffset = CGSizeMake(0, 0);//默认 0, -3
            hud.layer.shadowOpacity = 0.2;
            hud.bezelView.backgroundColor = [UIColor whiteColor];
            if (ScreenWidth < 375) {
                //5s手机
                hud.bezelView.transform = CGAffineTransformMakeScale(0.6, 0.6);
            }
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:kPathFile(@"webgif.gif")]];
        imageView.image = [UIImage sd_imageWithGIFData:data];
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = imageView;
        hud.bezelView.layer.shadowColor = [UIColor blackColor].CGColor;
        hud.layer.shadowOffset = CGSizeMake(0, 0);//默认 0, -3
        hud.layer.shadowOpacity = 0.2;
        hud.bezelView.backgroundColor = [UIColor whiteColor];
        if (ScreenWidth < 375) {
            //5s手机
            hud.bezelView.transform = CGAffineTransformMakeScale(0.6, 0.6);
        }
    }
}

/**
 Gif自定义持续加载框(适用于界面可以点击)
 */
void ShowGifCustomLoadingView(UIView *view) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(view);
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:kPathFile(@"webgif.gif")]];
            imageView.image = [UIImage sd_imageWithGIFData:data];
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = imageView;
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.bezelView.layer.shadowColor = [UIColor blackColor].CGColor;
            hud.layer.shadowOffset = CGSizeMake(0, 0);//默认 0, -3
            hud.layer.shadowOpacity = 0.2;
            hud.bezelView.backgroundColor = [UIColor whiteColor];
            if (ScreenWidth < 375) {
                //5s手机
                hud.bezelView.transform = CGAffineTransformMakeScale(0.6, 0.6);
            }
        });
    }else{
        MBProgressHUD *hud = baseHUDView(view);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:kPathFile(@"webgif.gif")]];
        imageView.image = [UIImage sd_imageWithGIFData:data];
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = imageView;
        hud.bezelView.layer.shadowColor = [UIColor blackColor].CGColor;
        hud.layer.shadowOffset = CGSizeMake(0, 0);//默认 0, -3
        hud.layer.shadowOpacity = 0.2;
        hud.bezelView.backgroundColor = [UIColor whiteColor];
        if (ScreenWidth < 375) {
            //5s手机
            hud.bezelView.transform = CGAffineTransformMakeScale(0.6, 0.6);
        }
    }
}


/**
 持续加载框
 自定义窗口
 
 @param message 提示信息
 @param view    自定义View
 */
void ShowLoadingView(UIView *view,NSString *message) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(view);
            hud.label.text = message;
            hud.mode = MBProgressHUDModeIndeterminate;
        });
    }else{
        MBProgressHUD *hud = baseHUDView(view);
        hud.label.text = message;
        hud.mode = MBProgressHUDModeIndeterminate;
    }
}


/**
 加载成功
 默认窗口
 
 @param message   提示信息
 @param completed 完成回调
 */
void ShowDefaultSuccessView(NSString *message,void(^completed)(void)) {
    UIImage *image = getBundleImageName(@"success");
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            PerformCustomHUDMethod(hud,message,image,completed);
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        PerformCustomHUDMethod(hud,message,image,completed);
    }
}

/**
 加载成功
 自定义窗口
 
 @param view      自定义View
 @param message   提示信息
 @param completed 完成回调
 */
void ShowSuccessView(UIView *view,NSString *message,void(^completed)(void)) {
    UIImage *image = getBundleImageName(@"success");
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            DismissDefaultHud();
            MBProgressHUD *hud = baseHUDView(view);
            PerformCustomHUDMethod(hud,message,image,completed);
        });
    }else{
        DismissDefaultHud();
        MBProgressHUD *hud = baseHUDView(view);
        PerformCustomHUDMethod(hud,message,image,completed);
    }
}


/**
 加载失败
 默认窗口
 
 @param message   提示信息
 @param completed 完成回调
 */
void ShowDefaultErrorView(NSString *message,void(^completed)(void)) {
    UIImage *image = [getBundleImageName(@"error") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            PerformCustomHUDMethod(hud,message,image,completed);
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        PerformCustomHUDMethod(hud,message,image,completed);
    }
}

/**
 加载失败
 自定义窗口
 
 @param view      自定义View
 @param message   提示信息
 @param completed 完成回调
 */
void ShowErrorView(UIView *view,NSString *message,void(^completed)(void)) {
    UIImage *image = [getBundleImageName(@"error") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(view);
            PerformCustomHUDMethod(hud,message,image,completed);
        });
    }else{
        MBProgressHUD *hud = baseHUDView(view);
        PerformCustomHUDMethod(hud,message,image,completed);
    }
}

/**
 加载自定义图片
 默认主窗口
 
 @param message    提示信息
 @param completed  完成回调
 */
extern void ShowDefaultCustomView(NSString *message,NSString *imageName,void(^completed)(void)) {
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            PerformCustomHUDMethod(hud,message,image,completed);
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        PerformCustomHUDMethod(hud,message,image,completed);
    }
}

/**
 执行自定义 HUD
 
 @param hud        MBProgressHUD
 @param message    提示信息
 @param image      自定义图片
 @param completed  完成回调
 */
void PerformCustomHUDMethod(MBProgressHUD *hud,NSString *message,UIImage *image,void(^completed)(void)) {
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = message;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    [hud hideAnimated:YES afterDelay:1];
    if (completed) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completed();
        });
    }
}


/**
 进度条
 默认窗口
 
 @param message    提示信息
 @param mode       MBProgressHUDMode
 */
MBProgressHUD* ShowDefaultProgressView(NSString *message,MBProgressHUDMode mode) {
    __block MBProgressHUD *hud;
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            hud = baseHUDView(DefalutWindow());
            hud.minSize = CGSizeZero;
            hud.label.text = message;
            hud.mode = mode;
        });
    }else{
        hud = baseHUDView(DefalutWindow());
        hud.label.text = message;
        hud.minSize = CGSizeZero;
        hud.minSize = CGSizeZero;
        hud.mode = mode;
    }
    return hud;
}


/**
 进度条
 自定义窗口
 
 @param view       自定义View
 @param message    提示信息
 @param mode       GomoreMBProgressHUDMode
 */
MBProgressHUD* ShowProgressView(UIView *view,NSString *message,MBProgressHUDMode mode) {
    
    __block MBProgressHUD *hud;
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            hud = baseHUDView(view);
            hud.minSize = CGSizeZero;
            hud.label.text = message;
            hud.mode = mode;
        });
    }else{
        hud = baseHUDView(view);
        hud.minSize = CGSizeZero;
        hud.label.text = message;
        hud.mode = mode;
    }
    return hud;
}

/**
 销毁指定View 所有HUD
 */
void DismissHud(UIView *view) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            HideMBProgressHUDForView(view);
        });
    }else{
        HideMBProgressHUDForView(view);
    }
}


/**
 销毁默认窗口 所有HUD
 */
void DismissDefaultHud(void) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            HideMBProgressHUDForView(DefalutWindow());
        });
    }else{
        HideMBProgressHUDForView(DefalutWindow());
    }
}


/**
 执行销毁
 
 @param view UIView
 */
void HideMBProgressHUDForView(UIView *view) {
    NSArray *hudArray = AllIndicatorViewForView(view);
    for (MBProgressHUD *hudView in hudArray) {
        [hudView hideAnimated:NO];
    }
}


/**
 获取指定view的所有 HUD
 
 @param view UIView
 @return NSArray
 */
NSArray* AllIndicatorViewForView(UIView *view) {
    NSMutableArray *hudArray = [NSMutableArray array];
    NSArray *subviews = view.subviews;
    for (UIView *aView in subviews) {
        if ([aView isKindOfClass:[MBProgressHUD class]]) {
            [hudArray addObject:aView];
        }
    }
    return [NSArray arrayWithArray:hudArray];
}

/**
 默认窗口
 
 @return UIWindow
 */
UIView *DefalutWindow(void) {
    return  [[UIApplication sharedApplication] keyWindow];
}



/**
 获取资源包图片
 
 @param imageName 图片名称
 */
UIImage* getBundleImageName(NSString *imageName) {
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}








@end
