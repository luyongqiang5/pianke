//
//  PKRegisterContentView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/17.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKRegisterContentView : UIView<UITextFieldDelegate>
@property (strong, nonatomic) UIButton          * sexManBtn;
@property (strong, nonatomic) UIButton          * sexWomanBtn;

@property (strong, nonatomic) UITextField       * nicknameText;
@property (strong, nonatomic) UITextField       * emailText;
@property (strong, nonatomic) UITextField       * passwordText;

@property (strong, nonatomic) UIButton          * accomplishBtn;

@property (strong, nonatomic) UIButton          * treatyBtn;
@end
