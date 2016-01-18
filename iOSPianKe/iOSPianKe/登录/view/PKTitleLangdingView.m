//
//  PKTitleLangdingView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/17.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKTitleLangdingView.h"
#import "Masonry.h"

@interface PKTitleLangdingView ()


@property (strong, nonatomic) UIImageView       * logoImgView;

@end

@implementation PKTitleLangdingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.registrationBtn];
        [self addSubview:self.logoImgView];
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
    
    [_registrationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(40, 15));
    }];
    
    [_logoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(120, 50));
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
}

- (UIButton *) backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];

    }
    return _backBtn;
}

- (UIButton *) registrationBtn{
    if (!_registrationBtn) {
        _registrationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registrationBtn setTitle:@"注册" forState:(UIControlStateNormal)];
        [_registrationBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        _registrationBtn.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    }
    return _registrationBtn;
}

- (UIImageView *) logoImgView{
    if (!_logoImgView) {
        _logoImgView = [[UIImageView alloc]init];
        [_logoImgView setImage:[UIImage imageNamed:@"片刻LOGO"]];
        
    }
    return _logoImgView;
}

@end
