//
//  UpdateModel.m
//  VersionUpdateView
//
//  Created by syt on 2020/4/28.
//  Copyright © 2020 syt. All rights reserved.
//

#import "UpdateModel.h"

@implementation UpdateModel

- (instancetype)initWithContent:(NSString *)content
{
    self = [super init];
    if (self) {
        self.content = content;
    }
    return self;
}

- (CGFloat)contentH
{
    if (!_contentH) {
        if (self.content) {
            _contentH = [self getSpaceLabelHeight:self.content withFont:[UIFont systemFontOfSize:14] withWidth:(k_Width - 60)] + 20;
        }
    }
    return _contentH;
}


- (CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 5;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle
    };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}







@end
