//
//  HTActionSheetTableViewCell.m
//  HanTalk
//
//  Created by 曹云霄 on 2018/4/16.
//  Copyright © 2018年 上海韩创科技有限公司. All rights reserved.
//

#import "HTActionSheetTableViewCell.h"
#import "Masonry.h"
@interface HTActionSheetTableViewCell ()

@property (nonatomic, strong) UIButton *button;
@end

@implementation HTActionSheetTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        self.button.enabled = NO;
        if (ScreenWidth < 375) {
            self.button.titleLabel.font = kPingFangRegularFont(13);
        }else{
            self.button.titleLabel.font = kPingFangRegularFont(15);
        }
        [self.button setTitleColor:kBlackColor forState:UIControlStateNormal];
        [self.button horizontalCenterImageAndTitle:10];
        [self.contentView addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }
    return self;
}

- (void)updateActionModel:(HTActionSheetModel *)model {
    [self.button setTitle:model.title forState:UIControlStateNormal];
    [self.button setTitleColor:model.color forState:UIControlStateNormal];
    if (model.iconName) {
        [self.button setImage:[UIImage imageNamed:model.iconName] forState:UIControlStateNormal];
    }
    self.accessoryType = model.isSelected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}






@end
