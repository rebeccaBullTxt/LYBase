//
//  LYTabBarMenusModel.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYBaseModel.h"

@protocol LYTabBarMenusModel_menu

@end


@interface LYTabBarMenusModel_menu : LYBaseModel

@property (nonatomic, assign) BOOL menu_storyboard;

@property (nonatomic, copy) NSString *menu_class;

@property (nonatomic, copy) NSString *menu_name;

@property (nonatomic, copy) NSString *menu_icon;

@property (nonatomic, copy) NSString *menu_icon_selected;

@property (nonatomic, copy) NSString *menu_storyboard_name;

@end

@interface LYTabBarMenusModel : LYBaseModel


@property (nonatomic, strong) NSArray <LYTabBarMenusModel_menu,Optional> *menus;

@end


