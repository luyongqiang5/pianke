//
//  PKLandingViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLandingViewController.h"
#import "PKThirdLandingView.h"//第三方登录
#import "PKEmailLandingView.h"//
#import "PKTitleLangdingView.h"
#import "PKRegisterViewController.h"
@interface PKLandingViewController ()<UITextFieldDelegate>
@property (strong, nonatomic)           PKThirdLandingView * thirdLanding;
@property (strong, nonatomic)           PKEmailLandingView * emailLandingView;
@property (strong, nonatomic)           PKTitleLangdingView *titleLangingView;
@end

@implementation PKLandingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.thirdLanding];
    [self.view addSubview:self.emailLandingView];
    [self.view addSubview:self.titleLangingView];
    [self addAutoLayout];
}

- (void)addAutoLayout{
    WS(weakSelf);
    [_thirdLanding mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.height.equalTo(105);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
    
    [_emailLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.thirdLanding.mas_top).offset(-50);
        make.height.equalTo(170);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
    }];
    
    [_titleLangingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.top.equalTo(weakSelf.view.mas_top).offset(30);
        make.height.equalTo(130);
    }];
}

-(PKTitleLangdingView *)titleLangingView{
    if (!_titleLangingView) {
        _titleLangingView = [[PKTitleLangdingView alloc]init];
        //返回按钮
        [_titleLangingView.backBtn addTarget:self action:@selector(returnToHomePage) forControlEvents:(UIControlEventTouchUpInside)];
        //注册按钮
        [_titleLangingView.registrationBtn addTarget:self action:@selector(pussToRegisterPage) forControlEvents:(UIControlEventTouchUpInside)];
    }

    return _titleLangingView;
}
//跳转到注册页
- (void)pussToRegisterPage{
    PKRegisterViewController *registerViewController = [[PKRegisterViewController alloc]init];
    [self presentViewController:registerViewController animated:YES completion:nil];
}
//返回首页
- (void)returnToHomePage{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (PKThirdLandingView *)thirdLanding{
    if (!_thirdLanding) {
        _thirdLanding = [[PKThirdLandingView alloc]init];
    }
    return _thirdLanding;
}

- (PKEmailLandingView *) emailLandingView{
    if (!_emailLandingView) {
        _emailLandingView = [[PKEmailLandingView alloc]init];
        //键盘的代理
        _emailLandingView.emailText.delegate = self;
        _emailLandingView.passwordText.delegate = self;
    }
    return _emailLandingView;
}
#pragma mark - 键盘的弹出与回去
//记得加代理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    if (textField == _emailLandingView.emailText) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 50;
            weakSelf.view.bounds = rect;
        }];
    }else {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 100;
            weakSelf.view.bounds = rect;
        }];
    }
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_emailLandingView.emailText resignFirstResponder];
    [_emailLandingView.passwordText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self textFieldShouldReturn:_emailLandingView.emailText];
//    [_emailLandingView.emailText resignFirstResponder];
//    [_emailLandingView.passwordText resignFirstResponder];
//    WS(weakSelf);
//    [UIView animateWithDuration:0.3 animations:^{
//        CGRect rect = weakSelf.view.bounds;
//        rect.origin.y = 0;
//        weakSelf.view.bounds = rect;
//    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
