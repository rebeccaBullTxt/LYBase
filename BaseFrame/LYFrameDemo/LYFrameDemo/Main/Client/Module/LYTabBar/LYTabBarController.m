//
//  LYTabBarController.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYTabBarController.h"
#import "LYTabBarMenusModel.h"
#import "LYBaseNavigationController.h"
@interface LYTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) LYTabBarMenusModel *menusModel;

@end

@implementation LYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

#pragma mark - 设置TabBarItem
- (void)setViewControllers {
    for (LYTabBarMenusModel_menu *menu in self.menusModel.menus) {
        UIViewController *vc = nil;
        if (menu.menu_storyboard) {
            vc = [NSClassFromString(menu.menu_class) viewControllerWithStoryBoardType:[menu.menu_storyboard_name integerValue]];
        }else {
            vc = [[NSClassFromString(menu.menu_class) alloc] init];
        }
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:vc.title image:[UIImage imageNamed:menu.menu_icon] selectedImage:[UIImage imageNamed:menu.menu_icon_selected]];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexRGB:@"#5676FC"],NSForegroundColorAttributeName,kPingFangRegularFont(10),NSFontAttributeName, nil] forState:UIControlStateSelected];
        vc.tabBarItem = item;
        vc.title = menu.menu_name;
        LYBaseNavigationController *nav = [[LYBaseNavigationController alloc] initWithRootViewController:vc];
        vc.navigationItem.title = vc.title;
        vc.tabBarItem.title = vc.title;
        [self addChildViewController:nav];
    }
}

#pragma mark - lazy
- (LYTabBarMenusModel *)menusModel {
    if (!_menusModel) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"HTTabBarMenus" ofType:@"plist"];
        NSArray *menus = [NSArray arrayWithContentsOfFile:plistPath];
        _menusModel = [[LYTabBarMenusModel alloc] initWithDictionary:@{@"menus": menus} error:nil];
    }
    return _menusModel;
}

@end
