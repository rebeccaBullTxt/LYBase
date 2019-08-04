//
//  LYBaseTableViewController.m
//  LYFrameDemo
//
//  Created by 刘渊 on 2019/8/4.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "LYBaseTableViewController.h"
#import "LYSectionView.h"
@interface LYBaseTableViewController ()

@end

@implementation LYBaseTableViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setSeparatorColor:[UIColor colorWithHexRGB:@"#DDDDDD"]];
    self.tableView.backgroundColor = kWhiteColor;
    [self.tableView registerClass:LYSectionView.class forHeaderFooterViewReuseIdentifier:LYSectionView.className];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kHeaderSectionH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return kFooterSectionH;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:LYSectionView.className];
}

- (void)dealloc {
    LYLog(@"释放%@成功",NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
