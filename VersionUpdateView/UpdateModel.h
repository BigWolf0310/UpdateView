//
//  UpdateModel.h
//  VersionUpdateView
//
//  Created by syt on 2020/4/28.
//  Copyright © 2020 syt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UpdateModel : NSObject

@property (nonatomic, strong) NSString *content;
// 根据内容计算文本的高度
@property (nonatomic, assign) CGFloat contentH;

- (instancetype)initWithContent:(NSString *)content;



@end

NS_ASSUME_NONNULL_END
