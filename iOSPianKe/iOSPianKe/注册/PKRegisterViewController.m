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
@interface PKRegisterViewController ()< UITextFieldDelegate,
                                        UIActionSheetDelegate,
                                        UINavigationControllerDelegate,
                                        UIImagePickerControllerDelegate >

@property(strong, nonatomic)PKHeadPortraitRegisterView          * headPortraotRegisterView;
@property(strong, nonatomic)PKRegisterContentView               * registerContentView;

@property (copy, nonatomic)           NSString *imageFiled;//图片
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
        make.height.equalTo(weakSelf.view.frame.size.height/20*13);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
    }];
}
//上部分：头像
-(PKHeadPortraitRegisterView *)headPortraotRegisterView{
    if (!_headPortraotRegisterView) {
        _headPortraotRegisterView = [[PKHeadPortraitRegisterView alloc]init];
        [_headPortraotRegisterView.backBtn addTarget:self action:@selector(returnToLandingPage) forControlEvents:UIControlEventTouchUpInside];
        [_headPortraotRegisterView.headProtraitBtn addTarget:self action:@selector(showSheet) forControlEvents:(UIControlEventTouchUpInside)];
        [_headPortraotRegisterView.cameraBtn addTarget:self action:@selector(showSheet) forControlEvents:(UIControlEventTouchUpInside)];
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
        [_registerContentView.accomplishBtn addTarget:self action:@selector(loginHttpRequest) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _registerContentView;
}
#pragma mark - 完成按钮
- (void)loginHttpRequest{
    [_registerContentView.emailText resignFirstResponder];
    [_registerContentView.passwordText resignFirstResponder];
    [_registerContentView.nicknameText resignFirstResponder];
    if ([_registerContentView.nicknameText.text isEmptyString]) {
        [self.view makeToast:@"用户名不能为空" duration:1 position:@"center"];
    }else if ([_registerContentView.passwordText.text isEmptyString]){
        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
    }else if ([_registerContentView.emailText.text isEmptyString]){
        [self.view makeToast:@"邮箱不能为空" duration:1 position:@"center"];
    }else if ([_headPortraotRegisterView.headProtraitBtn isEqual:[UIImage imageNamed:@"上传头像"]]){
        [self.view makeToast:@"头像不能为空" duration:1 position:@"center"];
    }else{
        [self upload];
    }
}
#pragma mark - 点击头像后的提示框
- (void)showSheet{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照", @"从相册中选择",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{   // 拍照
    if (buttonIndex == 0) {//buttonIndex是从弹出的框上从上往下数的
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;//指定使用照相机模式,可以指定使用相册／照片库
        picker.allowsEditing = YES;//设置拍照后的图片可被编辑
        picker.showsCameraControls = YES;
        [self presentViewController:picker animated:YES completion:nil];
    }else
        // 从相册中选择
        if(buttonIndex == 1) {
        UIImagePickerController *picker=[[UIImagePickerController alloc] init];
        picker.delegate=self;
        picker.allowsEditing=YES;
        [self presentViewController:picker animated:YES completion:nil];
    }else
        // 取消
        if(buttonIndex == 2) {
    }
    
}

#pragma 上传照片
- (void)upload{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":self.registerContentView.emailText.text,
                          @"gender":@"1",
                          @"passwd":self.registerContentView.passwordText.text,
                          @"uname":self.registerContentView.nicknameText.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          @"iconfile":@"170286123.png"};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-javascript"];
    
    [manager POST:@"http://api2.pianke.me/user/reg" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        UIImage *postImage = [UIImage imageWithContentsOfFile:_imageFiled];
        NSData *imageData = UIImageJPEGRepresentation(postImage, 0.1);
        
        [formData appendPartWithFileData:imageData name:@"iconfile" fileName:_imageFiled    mimeType:@"image/png"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"上传成功");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"上传失败");
    }];
}

#pragma mark UIImagePickerControllerDelegate 代理方法
// 当得到照片或者视频后，调用该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    NSString *homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    NSLog(@"------------%@",homePath);
    NSString *imageViews   = [homePath stringByAppendingFormat:@"/%d.png", arc4random_uniform(1000000)];
    [UIImageJPEGRepresentation(editedImage, 1.0f) writeToFile:imageViews atomically:YES];
    self.imageFiled = imageViews;
    [self.headPortraotRegisterView.headProtraitBtn setBackgroundImage:editedImage forState:(UIControlStateNormal)];
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark 判断相机可用不
// 前面的摄像头是否可用
- (BOOL) isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

// 后面的摄像头是否可用
- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}
#pragma mark - 相册文件选取相关
// 相册是否可用
- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma mark - 键盘的弹出与回去
//记得加代理

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 150;
        weakSelf.view.bounds = rect;
    }];
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
