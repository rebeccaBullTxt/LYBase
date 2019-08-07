//
//  HTActionSheetTableViewCell.h
//  HanTalk
//
//  Created by 曹云霄 on 2018/4/16.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTActionSheetModel.h"

@interface HTActionSheetTableViewCell : UITableViewCell

- (void)updateActionModel:(HTActionSheetModel *)model;

@end
