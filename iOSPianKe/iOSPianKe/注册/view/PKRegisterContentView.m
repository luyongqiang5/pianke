//
//  PKRegisterContentView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/17.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKRegisterContentView.h"
#import "Masonry.h"

@interface PKRegisterContentView ()

@property (strong, nonatomic) UILabel       * nicknameLbl;
@property (strong, nonatomic) UILabel       * emailLbl;
@property (strong, nonatomic) UILabel       * passwordLbl;

@property (strong, nonatomic) UILabel       * nicknameLine;
@property (strong, nonatomic) UILabel       * emailLine;
@property (strong, nonatomic) UILabel       * passwordLine;

@property (strong, nonatomic) UILabel       * treatyLbl;
@end
@implementation PKRegisterContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //性别
        [self addSubview:self.sexManBtn];
        [self addSubview:self.sexWomanBtn];
        //昵称
        [self addSubview:self.nicknameLbl];
        [self addSubview:self.nicknameText];
        [self addSubview:self.nicknameLine];
        //邮箱
        [self addSubview:self.emailLbl];
        [self addSubview:self.emailText];
        [self addSubview:self.emailLine];
        //密码
        [self addSubview:self.passwordLbl];
        [self addSubview:self.passwordText];
        [self addSubview:self.passwordLine];
        //完成
        [self addSubview:self.accomplishBtn];
        //说明  片刻协议
        [self addSubview:self.treatyLbl];
        [self addSubview:self.treatyBtn];
        
        [self addAutoLayout];
    }
    return self;
}

- (void)addAutoLayout{
    WS(weakSelf);
    //性别
    [_sexManBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.size.mas_equalTo(CGSizeMake(72, 36));
        make.right.equalTo(weakSelf.mas_centerX).offset(-40);
    }];
    [_sexWomanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.size.mas_equalTo(CGSizeMake(72, 36));
        make.left.equalTo(weakSelf.mas_centerX).offset(40);
    }];
    //昵称
    [_nicknameLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.sexManBtn.mas_bottom).offset(50);
        make.height.equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
    }];
    [_nicknameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nicknameLine.mas_left);
        make.size.mas_equalTo(CGSizeMake(42, 13));
        make.bottom.equalTo(weakSelf.nicknameLine.mas_top).offset(-10);
    }];
    [_nicknameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nicknameLbl.mas_right).offset(5);
        make.height.equalTo(30);
        make.right.equalTo(weakSelf.nicknameLine.mas_right);
        make.bottom.equalTo(weakSelf.nicknameLine.mas_top);
    }];
    //邮箱
    [_emailLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nicknameLine.mas_top).offset(50);
        make.height.equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
    }];
    [_emailLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.emailLine.mas_left);
        make.size.mas_equalTo(CGSizeMake(42, 13));
        make.bottom.equalTo(weakSelf.emailLine.mas_top).offset(-10);
    }];
    [_emailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.emailLbl.mas_right).offset(5);
        make.height.equalTo(30);
        make.right.equalTo(weakSelf.emailLine.mas_right);
        make.bottom.equalTo(weakSelf.emailLine.mas_top);
    }];
    //密码
    [_passwordLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.emailLine.mas_top).offset(50);
        make.height.equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
    }];
    [_passwordLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.passwordLine.mas_left);
        make.size.mas_equalTo(CGSizeMake(42, 13));
        make.bottom.equalTo(weakSelf.passwordLine.mas_top).offset(-10);
    }];
    [_passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.passwordLbl.mas_right).offset(5);
        make.height.equalTo(30);
        make.right.equalTo(weakSelf.passwordLine.mas_right);
        make.bottom.equalTo(weakSelf.passwordLine.mas_top);
    }];
    //完成
    [_accomplishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.passwordLine.mas_bottom).offset(30);
        make.height.equalTo(50);
        make.left.equalTo(weakSelf.passwordLine.mas_left);
        make.right.equalTo(weakSelf.passwordLine.mas_right);
    }];
    //说明
    [_treatyLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-10);
        make.size.mas_equalTo(CGSizeMake(256, 16));
        make.left.equalTo(weakSelf.mas_left).offset(40);
    }];
    [_treatyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.treatyLbl.mas_top);
        make.size.mas_equalTo(CGSizeMake(56, 16));
        make.right.equalTo(weakSelf.mas_right).offset(-40);
    }];
}
#pragma mark - 性别
- (UIButton *) sexManBtn{
    if (!_sexManBtn) {
        _sexManBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sexManBtn setBackgroundImage:[UIImage imageNamed:@"男"] forState:(UIControlStateNormal)];
        _sexManBtn.tag = 100;
        [_sexManBtn setBackgroundImage:[UIImage imageNamed:@"男_sel"] forState:(UIControlStateSelected)];
        [_sexManBtn addTarget:self action:@selector(changeSexBtnMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        _sexManBtn.selected = NO;
    }
    return _sexManBtn;
}
- (UIButton *) sexWomanBtn{
    if (!_sexWomanBtn) {
        _sexWomanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sexWomanBtn setBackgroundImage:[UIImage imageNamed:@"女"] forState:(UIControlStateNormal)];
        [_sexWomanBtn setBackgroundImage:[UIImage imageNamed:@"女_sel"] forState:(UIControlStateSelected)];
        _sexWomanBtn.tag = 101;
        [_sexWomanBtn addTarget:self action:@selector(changeSexBtnMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        _sexWomanBtn.selected = NO;
    }
    return _sexWomanBtn;
}
- (void)changeSexBtnMethod:(UIButton *)sender{
    if (self.sexManBtn.selected == NO && self.sexWomanBtn.selected == NO) {
        sender.selected = YES;
    }else if (sender.tag == 100){
        sender.selected = YES;
        _sexWomanBtn.selected = NO;
    }else if (sender.tag == 101){
        sender.selected = YES;
        _sexManBtn.selected = NO;
    }
}
#pragma mark - 昵称
- (UILabel *) nicknameLbl{
    if (!_nicknameLbl) {
        _nicknameLbl = [[UILabel alloc]init];
        _nicknameLbl.text = @"昵称:";
        _nicknameLbl.textColor = [UIColor blackColor];
        _nicknameLbl.textAlignment = NSTextAlignmentLeft;
        _nicknameLbl.font = [UIFont systemFontOfSize:14.0];
    }
    return _nicknameLbl;
}
- (UILabel *) nicknameLine{
    if (!_nicknameLine) {
        _nicknameLine = [[UILabel alloc]init];
        _nicknameLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _nicknameLine;
}
- (UITextField *) nicknameText {
    if (!_nicknameText) {
        _nicknameText = [[UITextField alloc]init];
        _nicknameText.textColor = [UIColor blackColor];
        _nicknameText.delegate = self;
        _nicknameText.borderStyle = UITextBorderStyleNone;
    }
    return _nicknameText;
}
#pragma mark - 邮箱
- (UILabel *) emailLbl{
    if (!_emailLbl) {
        _emailLbl = [[UILabel alloc]init];
        _emailLbl.textColor = [UIColor blackColor];
        _emailLbl.textAlignment = NSTextAlignmentLeft;
        _emailLbl.font = [UIFont systemFontOfSize:14.0];
        _emailLbl.text = @"邮箱:";
    }
    return _emailLbl;
}
- (UILabel *) emailLine{
    if (!_emailLine) {
        _emailLine = [[UILabel alloc]init];
        _emailLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _emailLine;
}
- (UITextField *) emailText {
    if (!_emailText) {
        _emailText = [[UITextField alloc]init];
        _emailText.textColor = [UIColor blackColor];
        _emailText.delegate = self;
        _emailText.borderStyle = UITextBorderStyleNone;
    }
    return _emailText;
}
#pragma mark - 密码
- (UILabel *) passwordLbl{
    if (!_passwordLbl) {
        _passwordLbl = [[UILabel alloc]init];
        _passwordLbl.textColor = [UIColor blackColor];
        _passwordLbl.textAlignment = NSTextAlignmentLeft;
        _passwordLbl.font = [UIFont systemFontOfSize:14.0];
        _passwordLbl.text = @"密码：";
    }
    return  _passwordLbl;
}
- (UILabel *) passwordLine{
    if (!_passwordLine) {
        _passwordLine = [[UILabel alloc]init];
        _passwordLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _passwordLine;
}
- (UITextField *) passwordText {
    if (!_passwordText) {
        _passwordText = [[UITextField alloc]init];
        _passwordText.textColor = [UIColor blackColor];
        _passwordText.delegate = self;
        _passwordText.secureTextEntry = YES;
        _passwordText.borderStyle = UITextBorderStyleNone;
    }
    return _passwordText;
}
#pragma mark - 完成按钮
- (UIButton *) accomplishBtn{
    if (!_accomplishBtn) {
        _accomplishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_accomplishBtn setBackgroundImage:[UIImage imageNamed:@"完成"] forState:(UIControlStateNormal)];
        [_accomplishBtn setTitle:@"完成" forState:(UIControlStateNormal)];
        [_accomplishBtn setBackgroundColor:[UIColor greenColor]];
        [_accomplishBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_accomplishBtn setBackgroundColor:RGB(119, 182, 69)];
    }
    return _accomplishBtn;
}

#pragma mark - 底下的说明
- (UILabel *) treatyLbl{
    if (!_treatyLbl) {
        _treatyLbl = [[UILabel alloc]init];
        _treatyLbl.textColor = [UIColor blackColor];
        _treatyLbl.textAlignment = NSTextAlignmentLeft;
        _treatyLbl.font = [UIFont systemFontOfSize:11];
        _treatyLbl.text = @"点击“完成“按钮，代表你已阅读并同意";
    }
    return _treatyLbl;
}
- (UIButton *) treatyBtn{
    if (!_treatyBtn) {
        _treatyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_treatyBtn setBackgroundImage:[UIImage imageNamed:@"片刻协议"] forState:(UIControlStateNormal)];
        [_treatyBtn setTitle:@"片刻协议" forState:(UIControlStateNormal)];
        [_treatyBtn setTitleColor:RGB(119, 182, 69)forState:(UIControlStateNormal)];
        _treatyBtn.titleLabel.font = [UIFont systemFontOfSize:11.0];
    }
    return _treatyBtn;
}

@end
