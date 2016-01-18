//
//  PKRegisterViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/17.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKRegisterViewController.h"
#import "PKHeadPortraitRegisterView.h"
#import "PKRegisterContentView.h"
@interface PKRegisterViewController ()<UITextFieldDelegate>

@property(strong, nonatomic)PKHeadPortraitRegisterView          * headPortraotRegisterView;
@property(strong, nonatomic)PKRegisterContentView               * registerContentView;
@end

@implementation PKRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headPortraotRegisterView];
    [self.view addSubview:self.registerContentView];
    [self addAutoLayout];
}

- (void)addAutoLayout{
    WS(weakSelf);
    [_headPortraotRegisterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(30);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(120);
    }];
    
    [_registerContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.height.equalTo(weakSelf.view.frame.size.height/3*2);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
    }];
}
//上部分：头像
-(PKHeadPortraitRegisterView *)headPortraotRegisterView{
    if (!_headPortraotRegisterView) {
        _headPortraotRegisterView = [[PKHeadPortraitRegisterView alloc]init];
        [_headPortraotRegisterView.backBtn addTarget:self action:@selector(returnToLandingPage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headPortraotRegisterView;
}
//下部分
-(PKRegisterContentView *)registerContentView{
    if (!_registerContentView) {
        _registerContentView = [[PKRegisterContentView alloc]init];
        _registerContentView.nicknameText.delegate = self;
        _registerContentView.emailText.delegate = self;
        _registerContentView.passwordText.delegate = self;
    }
    return _registerContentView;
}
#pragma mark - 键盘的弹出与回去
//记得加代理


//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    WS(weakSelf);
//    if (textField == _registerContentView.nicknameText) {
//        [UIView animateWithDuration:0.3 animations:^{
//            CGRect rect = weakSelf.view.bounds;
//            rect.origin.y = 55;
//            weakSelf.view.bounds = rect;
//        }];
//    }else if (textField == _registerContentView.emailText){
//        [UIView animateWithDuration:0.3 animations:^{
//            CGRect rect = weakSelf.view.bounds;
//            rect.origin.y = 110;
//            weakSelf.view.bounds = rect;
//        }];
//    }else {
//        [UIView animateWithDuration:0.3 animations:^{
//            CGRect rect = weakSelf.view.bounds;
//            rect.origin.y = 165;
//            weakSelf.view.bounds = rect;
//        }];
//    }
//    return YES;
//}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 150;
        weakSelf.view.bounds = rect;
    }];
//    if (textField == _registerContentView.nicknameText) {
//        [UIView animateWithDuration:0.3 animations:^{
//            CGRect rect = weakSelf.view.bounds;
//            rect.origin.y = 50;
//            weakSelf.view.bounds = rect;
//        }];
//    }else if (textField == _registerContentView.emailText){
//        [UIView animateWithDuration:0.3 animations:^{
//            CGRect rect = weakSelf.view.bounds;
//            rect.origin.y = 100;
//            weakSelf.view.bounds = rect;
//        }];
//    }else {
//        [UIView animateWithDuration:0.3 animations:^{
//            CGRect rect = weakSelf.view.bounds;
//            rect.origin.y = 150;
//            weakSelf.view.bounds = rect;
//        }];
//    }
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [_registerContentView.nicknameText resignFirstResponder];
    [_registerContentView.passwordText resignFirstResponder];
    [_registerContentView.emailText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_registerContentView.nicknameText resignFirstResponder];
    [_registerContentView.passwordText resignFirstResponder];
    [_registerContentView.emailText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self textFieldShouldReturn:_registerContentView.emailText];
}

//返回到登录页
- (void)returnToLandingPage{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
