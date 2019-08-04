//
//  BasePullTableViewController.h
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYBaseViewController.h"
#import "UIScrollView+EmptyDataSet.h"

@interface BasePullTableViewController : LYBaseViewController<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic, assign) LoadType emptyType;

/**
 公用tableview(StoryBoard)
 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 公用tableview(代码创建)
 */
@property (nonatomic, strong) UITableView *publicTableView;

/**
 子类需要自定义风格
 
 @param style UITableViewStyle
 */
- (void)setupBaseTableView:(UITableViewStyle)style;

/**
 添加上拉加载，下拉刷新
 
 @param tableView UITableView
 */
-(void)setupTableViewAdditional:(UITableView *)tableView;

/**
 加载页数 (默认从1开始)
 */
@property (nonatomic, assign) NSInteger pullPageIndex;

-(void)loadTableViewHeader;
-(void)loadTableViewFooter;

/**
 不需要上拉加载和下拉啥刷新
 */
- (void)hideRefreshView;

/**
 加载网络数据  需要重载
 */
-(void)loadWebDataSource;

/**
 结束刷新
 */
- (void)endRefresh:(EndRefreshType)type;

/**
 动画刷新
 */
- (void)reloadDataAnimation;

/**
 更新占位加载情况
 
 @param type 加载类型
 @param title Empty 显示标题
 @param imageName Empty 图片
 */
- (void)updateEmptyData:(LoadType)type emptyTitle:(NSAttributedString *)title emptyImg:(NSString *)imageName;

@end
