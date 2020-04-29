//
//  UpdateView.h
//  VersionUpdateView
//
//  Created by syt on 2020/4/28.
//  Copyright © 2020 syt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UpdateModel;

NS_ASSUME_NONNULL_BEGIN

@interface UpdateView : UIView


@property (nonatomic, copy) void (^updateButtonBlock) (void);

- (void)showUpdateView:(UpdateModel *)model;


@end

NS_ASSUME_NONNULL_END
