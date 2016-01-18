//
//  PKHeadPortraitRegisterView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/17.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKHeadPortraitRegisterView.h"
#import "Masonry.h"
@interface PKHeadPortraitRegisterView ()

@end

@implementation PKHeadPortraitRegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.headProtraitBtn];
        [self addSubview:self.cameraBtn];
        [self addAutoLayout];
    }
    return self;
}

- (void)addAutoLayout{
    WS(weakSelf);
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [_headProtraitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    [_cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_headProtraitBtn.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(32, 32));
        make.centerX.equalTo(_headProtraitBtn.mas_centerX).offset(24);
    }];
}

- (UIButton *) backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    }
    return _backBtn;
}

- (UIButton *) headProtraitBtn{
    if (!_headProtraitBtn) {
        _headProtraitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headProtraitBtn setBackgroundImage:[UIImage imageNamed:@"头像"] forState:(UIControlStateNormal)];
        [_headProtraitBtn.layer setMasksToBounds:YES];
        [_headProtraitBtn.layer setCornerRadius:40.0]; //设置矩形四个圆角半径
    }
    return _headProtraitBtn;
}

- (UIButton *) cameraBtn{
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setBackgroundImage:[UIImage imageNamed:@"相机"] forState:(UIControlStateNormal)];
        _cameraBtn.alpha = 0.7;
        [_cameraBtn.layer setMasksToBounds:YES];
        [_cameraBtn.layer setCornerRadius:15.0]; //设置矩形四个圆角半径
    }
    return _cameraBtn;
}

@end
