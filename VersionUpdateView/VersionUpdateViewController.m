//
//  VersionUpdateViewController.m
//  VersionUpdateView
//
//  Created by syt on 2020/4/28.
//  Copyright © 2020 syt. All rights reserved.
//

#import "VersionUpdateViewController.h"

#import "UpdateView.h"
#import "UpdateModel.h"

@interface VersionUpdateViewController ()

@property (nonatomic, strong) UIButton *updateButton;
@property (nonatomic, strong) UpdateView *updateView;
@property (nonatomic, strong) UpdateModel *model;

@end

@implementation VersionUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.updateButton];
}


#pragma mark - buttonAction
- (void)buttonAction
{
    if (self.updateView) {
        [self.updateView removeFromSuperview];
        self.updateView = nil;
    }
    [self.updateView showUpdateView:self.model];
}







#pragma mark - lazy loading

- (UIButton *)updateButton
{
    if (!_updateButton) {
        _updateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _updateButton.frame = CGRectMake(30, 100, k_Width - 60, 50);
        [_updateButton setTitle:@"显示更新页面" forState:UIControlStateNormal];
        [_updateButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        _updateButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_updateButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _updateButton;
}

- (UpdateView *)updateView
{
    if (!_updateView) {
        _updateView = [[UpdateView alloc] init]; // WithFrame:CGRectMake(0, 0, k_Width, k_Height)
        _updateView.updateButtonBlock = ^{ // 跳转商店
            NSLog(@"开始更新......");
        };
        [self.view.window addSubview:_updateView];
    }
    return _updateView;
}

- (UpdateModel *)model
{
    if (!_model) {
        _model = [[UpdateModel alloc] init];
        _model.content = @"1、更新版本信息，这里有很大的问题需要去完善，有没有人自告奋勇去解决这个问题\n2、新增页面，后续会有更多的内容上线，希望大家能够喜欢\n3、修复已知bug";
    }
    return _model;
}





@end
