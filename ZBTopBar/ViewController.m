//
//  ViewController.m
//  ZBTopBar
//
//  Created by 张波 on 2018/11/9.
//  Copyright © 2018 张波. All rights reserved.
//

#import "ViewController.h"
#import "ZBTopBarView.h"
#import "ZBTopBarModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	__block NSMutableArray *topBars = @[].mutableCopy;
	NSArray *ary = @[@{@"title":@"分时", @"selected":@(YES)}, @{@"title":@"五日", @"selected":@(NO)}, @{@"title":@"日K", @"selected":@(NO)}, @{@"title":@"周K", @"selected":@(NO)}, @{@"title":@"月K", @"selected":@(NO)}, @{@"title":@"1分", @"selected":@(NO)}];
	[ary enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
		ZBTopBarModel *topBar = [[ZBTopBarModel alloc] init];
		topBar.title = [obj objectForKey:@"title"];
		topBar.selected = [[obj objectForKey:@"selected"] boolValue];
		[topBars addObject:topBar];
	}];
	ZBTopBarView *topBarView = [[NSBundle mainBundle] loadNibNamed:@"ZBTopBarView" owner:self options:nil].lastObject;
	topBarView.backgroundColor = [UIColor yellowColor];
	topBarView.frame = CGRectMake(10, 200, self.view.frame.size.width - 20, 50);
	topBarView.topBars = topBars.copy;
	[self.view addSubview:topBarView];
}


@end
