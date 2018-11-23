//
//  ZBTopBarCell.m
//  ZBTopBar
//
//  Created by 张波 on 2018/11/9.
//  Copyright © 2018 张波. All rights reserved.
//

#import "ZBTopBarCell.h"

@interface ZBTopBarCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ZBTopBarCell

#pragma mark - Initialization
- (void)awakeFromNib
{
    [super awakeFromNib];
}

#pragma mark - Setter
- (void)setTopBar:(ZBTopBarModel *)topBar
{
	_topBar = topBar;
	self.titleLabel.text = topBar.title;
	self.titleLabel.textColor = topBar.selected ? [UIColor blueColor] : [UIColor brownColor];
}

@end
