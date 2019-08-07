//
//  HTActionSheetViewController.m
//  HanTalk
//
//  Created by 曹云霄 on 2018/4/16.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import "HTActionSheetViewController.h"
#import "Masonry.h"
#import "HTActionSheetTableViewCell.h"
#import "LYSectionView.h"

@interface HTActionSheetViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *actionTableView;
@property (nonatomic, strong) NSMutableArray <NSArray<HTActionSheetModel *> *>*datasArray;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, assign) CGFloat headerHeight;

@end

@implementation HTActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden{
    return NO;
}

- (void)addViews {
    [kWindow addSubview:self.bgView];
    CGFloat height = (self.datasArray[0].count + 1) * 44 + kHeaderSectionH + IPHONE_BOTTOMSAFEAREA;
    if (height > ScreenHeight - 100 ) {
        height = ScreenHeight - 100;
        _actionTableView.scrollEnabled = YES;
    }else {
        _actionTableView.scrollEnabled = NO ;
    }
    self.view.frame = CGRectMake(0, ScreenSize.height, ScreenSize.width, height + self.headerHeight);
    [self.bgView addSubview:self.view];
}

- (void)hiddenViews {
    [self.view removeFromSuperview];
    [self.bgView removeFromSuperview];
    [self.datasArray removeAllObjects];
    if (self.dismissSubject) {
        [self.dismissSubject sendNext:nil];
        [self.dismissSubject sendCompleted];
    }
}

- (void)showWithAnimation {
    [self addViews];
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.view.y = ScreenSize.height - self.view.height;
    }];
}

- (void)hiddenWithAnimation {
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        self.view.y = ScreenSize.height;
    } completion:^(BOOL finished) {
        [self hiddenViews];
    }];
}

- (void)showActionSheetView:(NSArray<HTActionSheetModel *> *)array {
    [self.datasArray addObject:array];
    HTActionSheetModel *cancelModel = [HTActionSheetModel title:@"取消" color:[UIColor blackColor]];
    [self.datasArray addObject:@[cancelModel]];
    self.headerHeight = 0;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 0.01)];
    self.actionTableView.tableHeaderView = headerView;
    [self.actionTableView reloadData];
    [self showWithAnimation];
}

- (void)showActionSheetView:(NSArray<HTActionSheetModel *> *)array title:(NSString *)title {
    [self.datasArray addObject:array];
    HTActionSheetModel *cancelModel = [HTActionSheetModel title:@"取消" color:[UIColor blackColor]];
    [self.datasArray addObject:@[cancelModel]];
    UIView *headerView = nil;
    if (title) {
        CGSize size = [title heightWithWidth:ScreenSize.width - 100 andFont:[UIFont systemFontOfSize:16]];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        label.text = title;
        label.textColor = k999999Color;
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, size.height + 20)];
        headerView.backgroundColor = kWhiteColor;
        [headerView addSubview:label];
        label.center = headerView.center;
        self.headerHeight = headerView.height;
    }
    [self showWithAnimation];
    self.actionTableView.tableHeaderView = headerView;
    [self.actionTableView reloadData];
}

- (void)updateActionSheetView:(NSArray<HTActionSheetModel *> *)array title:(NSString *)title {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hiddenViews];
        [self showActionSheetView:array title:title];
    });
}

#pragma mark - UITableView相关
- (void)setupTableView {
    [self.view addSubview:self.actionTableView];
    [self.actionTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.actionTableView.estimatedRowHeight = 0;
    self.actionTableView.estimatedSectionHeaderHeight = 0;
    self.actionTableView.estimatedSectionFooterHeight = 0;
    [self.actionTableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.actionTableView registerClass:LYSectionView.class forHeaderFooterViewReuseIdentifier:LYSectionView.className];
    [self.actionTableView registerClass:HTActionSheetTableViewCell.class forCellReuseIdentifier:HTActionSheetTableViewCell.className];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HTActionSheetTableViewCell *actionCell = [tableView dequeueReusableCellWithIdentifier:HTActionSheetTableViewCell.className forIndexPath:indexPath];
    [actionCell updateActionModel:self.datasArray[indexPath.section][indexPath.row]];
    return actionCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datasArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datasArray[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return kFooterSectionH;
    }
    return kHeaderSectionH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return kFooterSectionH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self hiddenWithAnimation];
    HTActionSheetModel *actionModel = self.datasArray[indexPath.section][indexPath.row];
    [actionModel.clickSubject sendNext:actionModel];
}

#pragma mark - UITapGestureRecognizer相关
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isDescendantOfView:self.view]) {
        return NO;
    }
    return YES;
}

#pragma mark - lazy
- (UITableView *)actionTableView {
    if (!_actionTableView) {
        _actionTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _actionTableView.delegate = self;
        _actionTableView.dataSource = self;
        _actionTableView.scrollEnabled = NO;
    }
    return _actionTableView;
}

- (NSMutableArray <NSArray <HTActionSheetModel *> *> *)datasArray {
    if (!_datasArray) {
        _datasArray = [NSMutableArray array];
    }
    return _datasArray;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenWithAnimation)];
        tap.delegate = self;
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"释放");
}

@end
