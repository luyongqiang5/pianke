//
//  PKThirdLandingView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKThirdLandingView.h"
#import "Masonry.h"
@interface PKThirdLandingView ()

@property (strong, nonatomic)       UIButton * xinLang; // 新浪
@property (strong, nonatomic)       UIButton * renRen;  // 人人
@property (strong, nonatomic)       UIButton * douBan;  // 豆瓣
@property (strong, nonatomic)       UIButton * qq;      // QQ
@property (strong, nonatomic)       UILabel  * textLabel;//合作伙伴
@property (strong, nonatomic)       UILabel  * lineLabel;//线条

@end

@implementation PKThirdLandingView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.xinLang];
        [self addSubview:self.renRen];
        [self addSubview:self.douBan];
        [self addSubview:self.qq];
        [self addSubview:self.lineLabel];
        [self addSubview:self.textLabel];
        [self addAutoLayout];
    }
    return self;
}

- (void)addAutoLayout{
    WS(weakSelf);
    CGFloat width = (VIEW_WIDTH - 100.0)/5.0;
    
    [_xinLang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    [_renRen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_xinLang.mas_right).offset(width);
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(_xinLang.mas_centerY);
    }];
    
    [_douBan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_renRen.mas_right).offset(width);
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(_xinLang.mas_centerY);
    }];
    
    [_qq  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_douBan.mas_right).offset(width);
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(_xinLang.mas_centerY);
    }];
    
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.size.mas_equalTo(CGSizeMake(125, 13));
        make.centerX.equalTo(weakSelf.mas_centerX);
        
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(30);
        make.right.equalTo(weakSelf.mas_right).offset(-20);
        make.height.equalTo(2);
        make.centerY.equalTo(_textLabel.mas_centerY);
    }];
}

- (UIButton *) xinLang{
    if (!_xinLang) {
        _xinLang = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xinLang setBackgroundImage:[UIImage imageNamed:@"新浪"] forState:(UIControlStateNormal)];
    }
    return _xinLang;
}

- (UIButton *) renRen{
    if (!_renRen) {
        _renRen = [UIButton buttonWithType:UIButtonTypeCustom];
        [_renRen setBackgroundImage:[UIImage imageNamed:@"人人"] forState:(UIControlStateNormal)];
    }
    return _renRen;
}

- (UIButton *) douBan{
    if (!_douBan) {
        _douBan = [UIButton buttonWithType:UIButtonTypeCustom];
        [_douBan setBackgroundImage:[UIImage imageNamed:@"豆瓣"] forState:(UIControlStateNormal)];
    }
    return _douBan;
}

- (UIButton *) qq{
    if (!_qq) {
        _qq = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qq setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:(UIControlStateNormal)];
    }
    return _qq;
}

- (UILabel *) textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        _textLabel.text = @"合作伙伴登录片刻";
        _textLabel.textColor = [UIColor darkGrayColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:12];
        _textLabel.backgroundColor = [UIColor whiteColor];
    }
    return _textLabel;
}

- (UILabel *) lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.textColor = [UIColor lightGrayColor];
        _lineLabel.textAlignment = NSTextAlignmentCenter;
        _lineLabel.text = @"————————————————————————————————————————————";
        
    }
    return _lineLabel;
}

@end
