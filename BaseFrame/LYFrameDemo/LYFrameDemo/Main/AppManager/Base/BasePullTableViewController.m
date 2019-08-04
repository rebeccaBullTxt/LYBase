//
//  BasePullTableViewController.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "BasePullTableViewController.h"
#import "MJRefresh.h"
@interface BasePullTableViewController()

@property (nonatomic, copy) NSAttributedString *emptyTitle;
@property (nonatomic, copy) NSString *emptyImg;
@end

@implementation BasePullTableViewController

- (void)viewDidLoad{
    [self setupBaseTableView:UITableViewStyleGrouped];
}

#pragma mark -初始化设置
- (void)setupBaseTableView:(UITableViewStyle)style{
    if (!self.tableView) {
        self.publicTableView = [[UITableView alloc] initWithFrame:self.view.frame style:style];
        self.publicTableView.backgroundColor = kWhiteColor;
        self.publicTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.publicTableView.delegate = self;
        self.publicTableView.dataSource = self;
        self.publicTableView.emptyDataSetSource = self;
        self.publicTableView.emptyDataSetDelegate = self;
        self.tableView.tableFooterView = [UIView new];
        if (@available(iOS 11.0, *)) {
            self.publicTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.publicTableView.estimatedRowHeight = 0;
            self.publicTableView.estimatedSectionHeaderHeight = 0;
            self.publicTableView.estimatedSectionFooterHeight = 0;
        }
        [self setupTableViewAdditional:self.publicTableView];
        return;
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.tableFooterView = [UIView new];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
    [self setupTableViewAdditional:self.tableView];
}

#pragma mark - 添加上、下拉刷新
-(void)setupTableViewAdditional:(UITableView *)tableView {
    @weakify(self);
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self loadTableViewHeader];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    header.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    tableView.mj_header = header;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self loadTableViewFooter];
    }];
    footer.automaticallyHidden = YES;
    //默认关闭自动加载下一页，子类可自行开启
    footer.automaticallyRefresh = NO;
    footer.onlyRefreshPerDrag = YES;
    footer.triggerAutomaticallyRefreshPercent = -20;
    tableView.mj_footer = footer;
    [footer setTitle:@" " forState:MJRefreshStateIdle];
    [footer setTitle:@"- 加载中 -" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"- 我是有底线的 -" forState:MJRefreshStateNoMoreData];
}

#pragma mark -刷新回调
-(void)loadTableViewHeader {
    if (self.publicTableView) {
        [self.publicTableView.mj_footer resetNoMoreData];
    }else {
        [self.tableView.mj_footer resetNoMoreData];
    }
    self.pullPageIndex = 1;
    [self loadWebDataSource];
}

-(void)loadTableViewFooter {
    self.pullPageIndex ++;
    [self loadWebDataSource];
}

#pragma mark -加载数据 (需重写)
-(void)loadWebDataSource {
    if (self.publicTableView) {
        if (self.publicTableView.isEmptyDataSetVisible) {
            [self.publicTableView reloadEmptyDataSet];
        }
    }else {
        if (self.tableView.isEmptyDataSetVisible) {
            [self.tableView reloadEmptyDataSet];
        }
    }
}

#pragma mark - 不需要上拉加载和下拉刷新
- (void)hideRefreshView {
    if (self.publicTableView) {
        self.publicTableView.mj_footer = nil;
        self.publicTableView.mj_header = nil;
    }else {
        self.tableView.mj_footer = nil;
        self.tableView.mj_header = nil;
    }
}

#pragma mark - 动画刷新
- (void)reloadDataAnimation {
    if (self.publicTableView) {
        [UIView transitionWithView:self.publicTableView duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self.publicTableView reloadData];
        } completion:nil];
    }else {
        [UIView transitionWithView:self.tableView duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self.tableView reloadData];
        } completion:nil];
    }
}

#pragma mark -结束刷新
- (void)endRefresh:(EndRefreshType)type {
    if (self.publicTableView) {
        [self endRefresh:type tableView:self.publicTableView];
    }else {
        [self endRefresh:type tableView:self.tableView];
    }
}

- (void)endRefresh:(EndRefreshType)type tableView:(UITableView *)tableView {
    if (type == EndRefreshNotData) {
        [tableView.mj_footer endRefreshingWithNoMoreData];
    }else if (tableView.mj_footer.isRefreshing) {
        [tableView.mj_footer endRefreshing];
    }
    if (tableView.mj_header.isRefreshing) {
        [tableView.mj_header endRefreshing];
    }
}

#pragma mark -UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kFooterSectionH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return kFooterSectionH;
}

- (void)setEmptyType:(LoadType)emptyType {
    _emptyType = emptyType;
    if (self.publicTableView) {
        [self.publicTableView reloadEmptyDataSet];
    }else {
        [self.tableView reloadEmptyDataSet];
    }
}

/**
 更新占位加载情况
 
 @param type 加载类型
 @param title Empty 显示标题
 @param imageName Empty 图片
 */
- (void)updateEmptyData:(LoadType)type emptyTitle:(NSAttributedString *)title emptyImg:(NSString *)imageName {
    _emptyType = type;
    _emptyImg = imageName;
    _emptyTitle = title;
    if (self.publicTableView) {
        [self.publicTableView reloadEmptyDataSet];
    }else {
        [self.tableView reloadEmptyDataSet];
    }
}

#pragma mark - DZNEmptyDataSetSource Methods
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    switch (self.emptyType) {
        case Loading: {
            return nil;
        }
            break;
        case LoadError: {
            return [UIImage imageNamed:self.emptyImg];
        }
            break;
        case LoadNotData: {
            return [UIImage imageNamed:self.emptyImg];
        }
            break;
        case LoadSuccess: {
            return [UIImage imageNamed:self.emptyImg];
        }
            break;
        case LoadTimeOut: {
            return [UIImage imageNamed:self.emptyImg];
        }
            break;
        default:
            break;
    }
    return nil;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    switch (self.emptyType) {
        case Loading: {
            return nil;
        }
            break;
        case LoadError: {
            return self.emptyTitle;
        }
            break;
        case LoadNotData: {
            return self.emptyTitle;
        }
            break;
        case LoadSuccess: {
            return self.emptyTitle;
        }
            break;
        case LoadTimeOut: {
            return self.emptyTitle;
        }
            break;
        default:
            break;
    }
    return nil;
}



- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    if (self.emptyType == LoadTimeOut ) {
        UIImage *image = [UIImage imageNamed:@"fresh"];
        return image;
    }
    return nil;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.emptyType == LoadTimeOut ) {
        
        return 94;
    }
    return 11;
}
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    
    return - IPHONE_NAVIGATION_HEIGHT ;
}

#pragma mark - DZNEmptyDataSetDelegate Methods
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    // button clicked...
    if (self.emptyType == LoadTimeOut ) {
        [self loadWebDataSource];
    }
}

- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView {
    if (self.publicTableView) {
        self.publicTableView.contentOffset = CGPointZero;
    }else {
        self.tableView.contentOffset = CGPointZero;
    }
}

- (BOOL)emptyDataSetShouldShow:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}
@end
