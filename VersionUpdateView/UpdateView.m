//
//  UpdateView.m
//  VersionUpdateView
//
//  Created by syt on 2020/4/28.
//  Copyright © 2020 syt. All rights reserved.
//

#import "UpdateView.h"

#import "UpdateModel.h"


@interface UpdateView ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UIButton *cancleButton;
@property (nonatomic, strong) UIView *vLineV;
@property (nonatomic, strong) UIButton *confirmButton;
// 内容的默认高度
@property (nonatomic, assign) CGFloat contentH;

@end


@implementation UpdateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:.2];
        self.contentH = 30;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews
{
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.contentLabel];
    [self.bgView addSubview:self.lineV];
    [self.bgView addSubview:self.cancleButton];
    [self.bgView addSubview:self.confirmButton];
    [self.bgView addSubview:self.vLineV];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.mas_equalTo(self.contentH + 90);
        make.center.equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bgView);
        make.top.equalTo(self.bgView).offset(10);
        make.height.mas_equalTo(20);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.bgView).offset(10);
        make.right.equalTo(self.bgView).offset(-10);
        make.height.mas_equalTo(self.contentH);
    }];
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom);
        make.left.right.equalTo(self.bgView);
        make.height.mas_equalTo(1);
    }];
    [self.cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.bgView);
        make.width.mas_equalTo((k_Width - 40) / 2);
        make.height.mas_equalTo(49);
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.bgView);
        make.width.height.mas_equalTo(self.cancleButton);
    }];
    [self.vLineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineV.mas_bottom);
        make.bottom.equalTo(self.bgView);
        make.width.mas_equalTo(1);
        make.centerX.equalTo(self.bgView);
    }];
}




#pragma mark - buttonAction
- (void)buttonAction:(UIButton *)button
{
    NSInteger tag = button.tag;
    [self removeUpdateView];
    if (tag == 1002) {
        if (self.updateButtonBlock) {
            self.updateButtonBlock();
        }
    }
}

#pragma mark - tapAction
- (void)tapAction
{
    NSLog(@"移除了全世界");
//    [self removeUpdateView];
}

#pragma mark - 从父视图上面移除
- (void)removeUpdateView
{
    [UIView animateWithDuration:.5f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (self) {
            [self removeFromSuperview];
        }
    }];
}


- (void)showUpdateView:(UpdateModel *)model
{
    self.frame = CGRectMake(0, 0, k_Width, k_Height);
    [UIView animateWithDuration:.5f animations:^{
        self.alpha = 1;
        self.contentLabel.text = [NSString stringWithFormat:@"%@", model.content];
        [self setLineSpaceLabel:self.contentLabel];
        self.contentH = model.contentH;
    }];
}


#pragma mark - 设置行间距
- (void)setLineSpaceLabel:(UILabel *)label
{
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.lineSpacing = 5;
    [attr addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, label.text.length)];
    label.attributedText = attr;
}









#pragma mark - lazy loading

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = UIColor.whiteColor;
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 8;
    }
    return _bgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"版本更新";
        _titleLabel.textColor = UIColor.blackColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.text = @"我是更新的内容";
        _contentLabel.textColor = k_Color(145, 145, 145, 1.0);
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UIView *)lineV
{
    if (!_lineV) {
        _lineV = [[UIView alloc] init];
        _lineV.backgroundColor = k_Color(230, 230, 230, 1.0);
    }
    return _lineV;
}

- (UIButton *)cancleButton
{
    if (!_cancleButton) {
        _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancleButton setTitle:@"我知道了" forState:UIControlStateNormal];
        [_cancleButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _cancleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _cancleButton.tag = 1001;
        [_cancleButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleButton;
}

- (UIView *)vLineV
{
    if (!_vLineV) {
        _vLineV = [[UIView alloc] init];
        _vLineV.backgroundColor = k_Color(230, 230, 230, 1.0);
    }
    return _vLineV;
}

- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmButton setTitle:@"更新" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _confirmButton.tag = 1002;
        [_confirmButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}





@end
