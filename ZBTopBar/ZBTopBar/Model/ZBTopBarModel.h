//
//  ZBTopBarModel.h
//  ZBTopBar
//
//  Created by 张波 on 2018/11/9.
//  Copyright © 2018 张波. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBTopBarModel : NSObject

@property (copy,   nonatomic) NSString *title;
@property (assign, nonatomic) BOOL selected;

@end

NS_ASSUME_NONNULL_END
