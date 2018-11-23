//
//  ZBTopBarView.h
//  ZBTopBar
//
//  Created by 张波 on 2018/11/9.
//  Copyright © 2018 张波. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZBTopBarModel;

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZBTopBarSelectBlock)(NSInteger index);

@interface ZBTopBarView : UIView

@property (strong, nonatomic) NSArray<ZBTopBarModel *> *topBars;
@property (copy,   nonatomic) ZBTopBarSelectBlock selectBlock;

@end

NS_ASSUME_NONNULL_END
