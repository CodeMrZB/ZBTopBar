//
//  ZBTopBarView.m
//  ZBTopBar
//
//  Created by 张波 on 2018/11/9.
//  Copyright © 2018 张波. All rights reserved.
//

#import "ZBTopBarView.h"
#import "ZBTopBarCell.h"

@interface ZBTopBarView()
<
	UICollectionViewDelegate,
	UICollectionViewDataSource,
	UICollectionViewDelegateFlowLayout
>

//UI
@property (weak,   nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) UIView *lineView;

//数据
@property (assign, nonatomic) NSInteger selectedIndex;

@end

static NSString *const TopBarCellID = @"ZBTopBarCell";

@implementation ZBTopBarView

#pragma mark - Initialization
- (void)awakeFromNib
{
	[super awakeFromNib];
	[self addSubview];
}

- (void)addSubview
{
	UINib *nib = [UINib nibWithNibName:NSStringFromClass([ZBTopBarCell class]) bundle:nil];
	[self.collectionView registerNib:nib forCellWithReuseIdentifier:TopBarCellID];
	[self.collectionView addSubview:self.lineView];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	[collectionView deselectItemAtIndexPath:indexPath animated:YES];
	[self didSelectItemAtIndexPath:indexPath];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return self.topBars.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	ZBTopBarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TopBarCellID forIndexPath:indexPath];
	cell.topBar = self.topBars[indexPath.item];
	return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return CGSizeMake(80, self.frame.size.height);
}

#pragma mark - Method
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	if (self.selectedIndex == indexPath.item) return;
	self.selectedIndex = indexPath.item;
	[self.topBars enumerateObjectsUsingBlock:^(ZBTopBarModel *topBar, NSUInteger idx, BOOL * _Nonnull stop) {
		topBar.selected = idx == indexPath.item;
	}];
	[self.collectionView reloadData];
	
	UICollectionViewLayoutAttributes *attributes = [self.collectionView layoutAttributesForItemAtIndexPath:indexPath];
	[UIView animateWithDuration:0.3 animations:^{
		self.lineView.transform = CGAffineTransformMakeTranslation(attributes.frame.origin.x, 0);
	} completion:^(BOOL finished) {
		[self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
	}];
	
	if (self.selectBlock)
	{
		self.selectBlock(indexPath.item);
	}
}

#pragma mark - Setter
- (void)setTopBars:(NSArray<ZBTopBarModel *> *)topBars
{
	_topBars = topBars;
	[self.collectionView reloadData];
}

#pragma mark - Getter
- (UIView *)lineView
{
	if (!_lineView)
	{
		_lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 48, 60, 2)];
		_lineView.backgroundColor = [UIColor blueColor];
	}
	return _lineView;
}

@end
