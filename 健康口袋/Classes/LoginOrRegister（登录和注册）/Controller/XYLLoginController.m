//
//  XYLLoginController.m
//  健康口袋
//
//  Created by 薛银亮 on 16/3/2.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLLoginController.h"
#import "XYLTabBarController.h"

#define UpHeightFloat 100
@interface XYLLoginController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLineConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerLoginViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerDengluConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLineConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomCenterConstraint;

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
//提交按钮
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UIButton *registerContirmButton;
//选择按钮
@property (weak, nonatomic) IBOutlet UIButton *selectLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *selectRegisterButton;

@end

@implementation XYLLoginController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNewConstraints];
    [self setTextField];
    self.registerContirmButton.hidden = YES;
    self.selectLoginButton.hidden = YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setBackConstraints];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
//确认登录
- (IBAction)confirmEvent:(id)sender
{
    if (![self checkInputData]) {
        return;
    }
    [BmobUser loginInbackgroundWithAccount:self.accountTextField.text andPassword:self.passwordTextField.text block:^(BmobUser *user, NSError *error) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",error.userInfo[@"NSLocalizedDescription"]]];
        }else{
            //保存用户数据,bmob已经在登录成功的时候帮我们在本地磁盘保存了一份用户的数据，所以这里我们不用保存了
//            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//            [userDefault setObject:user.username forKey:@"username"];
//            [userDefault setObject:user.email forKey:@"email"];
            //暂时跳转到主界面
            XYLTabBarController *xylTabBarController = [[XYLTabBarController alloc]init];
            [self presentViewController:xylTabBarController animated:YES completion:nil];
        }
    }];
}
//确认注册
- (IBAction)registerConfirmEvent:(id)sender
{
    if (![self checkInputData]) {
        return;
    }
    
    BmobUser *bUser = [[BmobUser alloc] init];
    bUser.username = self.accountTextField.text;
    [bUser setEmail:self.accountTextField.text];
    [bUser setPassword:self.passwordTextField.text];
    __block XYLLoginController *xylBlockSelf = self;
    [bUser signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
        if (isSuccessful){
            [SVProgressHUD showSuccessWithStatus:@"注册完成，请登录您的邮箱验证"];
            [xylBlockSelf selectLoginEvent:_selectLoginButton];
        } else
        {
            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",error.userInfo[@"NSLocalizedDescription"]]];
        }
    }];
}

//检查输入账号密码是否合法
-(BOOL)checkInputData
{
    XYLCommon *xylCommon = [XYLCommon sharedXYLCommon];
    if (self.accountTextField.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入邮箱"];
        return NO;
    }else if (self.passwordTextField.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return NO;
    }else if(![xylCommon isValidateEmail:self.accountTextField.text]){
        [SVProgressHUD showErrorWithStatus:@"邮箱不正确"];
        return NO;
    }else{
        return YES;
    }
}

//忘记密码
- (IBAction)forgetPasswordEvent:(id)sender
{
    [SVProgressHUD showErrorWithStatus:@"暂时没有此功能"];
}
//游客
- (IBAction)visitorEvent:(id)sender
{
    XYLTabBarController *xylTabBarController = [[XYLTabBarController alloc]init];
    [self presentViewController:xylTabBarController animated:YES completion:nil];
}
//选择注册事件
- (IBAction)registerEvent:(id)sender
{
    self.confirmButton.hidden = YES;
    self.selectRegisterButton.hidden = YES;
    self.registerContirmButton.hidden = NO;
    self.selectLoginButton.hidden = NO;
    self.accountTextField.placeholder = @"请选择要注册的邮箱";
    [self.accountTextField becomeFirstResponder];
}
//选择登录事件
- (IBAction)selectLoginEvent:(id)sender
{
    self.confirmButton.hidden = NO;
    self.selectRegisterButton.hidden = NO;
    self.registerContirmButton.hidden = YES;
    self.selectLoginButton.hidden = YES;
    self.accountTextField.placeholder = @"请输入已验证邮箱";
    [self.accountTextField becomeFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    __block CGRect frame = self.view.frame;
    if (frame.origin.y == 0)
    {
        [UIView animateWithDuration:0.5 animations:^{
            frame.origin.y -= UpHeightFloat;
            self.view.frame = frame;
        }];
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    __block CGRect frame = self.view.frame;
        if (frame.origin.y < 0)
        {
            [UIView animateWithDuration:0.5 animations:^{
                frame.origin.y = 0;
                self.view.frame = frame;
            }];
        }
}
-(void)textFieldEditing:(UITextField *)textField
{
    [self setConfirmButtonState];
}
-(void)setTextField
{
    self.accountTextField.delegate = self;
    self.passwordTextField.delegate = self;
    [self.accountTextField addTarget:self action:@selector(textFieldEditing:) forControlEvents:UIControlEventEditingChanged];
    [self.passwordTextField addTarget:self action:@selector(textFieldEditing:) forControlEvents:UIControlEventEditingChanged];
}
-(void)setConfirmButtonState
{
    if (self.accountTextField.text.length != 0 && self.passwordTextField.text.length != 0) {
        self.registerContirmButton.enabled = YES;
        self.registerContirmButton.titleLabel.textColor = [UIColor whiteColor];
        self.confirmButton.enabled = YES;
        self.confirmButton.titleLabel.textColor = [UIColor whiteColor];
    }else{
        self.confirmButton.enabled = NO;
        self.confirmButton.titleLabel.textColor = [UIColor grayColor];
        self.registerContirmButton.enabled = NO;
        self.registerContirmButton.titleLabel.textColor = [UIColor grayColor];
    }
}
-(void)setNewConstraints
{
    self.headImageView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    self.headImageView.transform = CGAffineTransformMakeTranslation(0, -500);
    self.registerWidthConstraint.constant = 0;
    self.leftLineConstraint.constant = 120;
    self.rightLineConstraint.constant = 120;
    self.bottomCenterConstraint.constant = -350;
    self.centerLoginViewConstraint.constant = -350;
    self.centerDengluConstraint.constant = 350;
}
-(void)setBackConstraints
{
    // 约束的修改是重新布局的
    self.registerWidthConstraint.constant = 102;
    self.leftLineConstraint.constant = 8;
    self.rightLineConstraint.constant = 8;
    self.bottomCenterConstraint.constant = 0;
    self.centerLoginViewConstraint.constant = 0;
    self.centerDengluConstraint.constant = 0;
    
    [UIView animateWithDuration:2 delay:0.5 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.headImageView.transform = CGAffineTransformIdentity;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}
@end
