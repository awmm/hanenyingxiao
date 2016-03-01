//
//  LoginViewController.m
//  移动营销
//
//  Created by wmm on 16/2/24.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "Toast+UIView.h"
#import "JudgeNumber.h"
#import "MyTabBarController.h"
#import "DataTool.h"
#import "ForgetPassViewController.h"

@interface LoginViewController (){

}

@property (nonatomic, strong) UITextField *phoneFld;
@property (nonatomic, strong) UITextField *passFld;

@property (nonatomic, strong) UIButton *remPassBtn;
@property (readonly, nonatomic) int isRemPass;

@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat statusBarHeight = 0;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        statusBarHeight = 20;
    }
    self.navigationItem.title = @"登录";
    
    UIImageView *phoneImg = [[UIImageView alloc] initWithFrame:CGRectMake1(20,statusBarHeight+44+20, 22, 24)];
    phoneImg.image = [UIImage imageNamed:@"phone.png"];
    [self.view addSubview:phoneImg];
    
    UILabel *phoneLab = [[UILabel alloc] initWithFrame:CGRectMake1(50,statusBarHeight+44+20, 80, 22)];
    phoneLab.text = @"手机号";
    phoneLab.textColor = blackFontColor;
    phoneLab.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:phoneLab];
    _phoneFld = [[UITextField alloc] initWithFrame:CGRectMake1(130,statusBarHeight+44+20, 170, 22)];
    _phoneFld.placeholder = @"请输入手机号";
    _phoneFld.keyboardType = UIKeyboardTypePhonePad;//电话键盘
    [_phoneFld setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_phoneFld];
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake1(10,statusBarHeight+44+20+37, KSCreenW-20, 1)];
    line.layer.borderWidth = 18;
    line.layer.borderColor = [grayLineColor CGColor];
    [self.view addSubview:line];
    
    
    UIImageView *checkImg = [[UIImageView alloc] initWithFrame:CGRectMake1(20,statusBarHeight+44+20+57, 22, 24)];
    checkImg.image = [UIImage imageNamed:@"pass2.png"];
    [self.view addSubview:checkImg];
    UILabel *checkLab = [[UILabel alloc] initWithFrame:CGRectMake1(50,statusBarHeight+44+20+57, 80, 22)];
    checkLab.text = @"登录密码";
    checkLab.textColor = blackFontColor;
    checkLab.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:checkLab];
    _passFld = [[UITextField alloc] initWithFrame:CGRectMake1(130,statusBarHeight+44+20+57, 170, 22)];
    _passFld.placeholder = @"请输入密码";
    _passFld.returnKeyType =UIReturnKeyGo;//return键
    _passFld.secureTextEntry = YES;//密码
    [_passFld setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_passFld];
    UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake1(10,statusBarHeight+44+20+57+37, KSCreenW-20, 1)];
    line2.layer.borderWidth = 1;
    line2.layer.borderColor = [grayLineColor CGColor];
    [self.view addSubview:line2];
    
    
    _remPassBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_remPassBtn setBackgroundImage:[UIImage imageNamed:@"rempass.png"] forState:UIControlStateNormal];
    _isRemPass = 1;
    _remPassBtn.frame = CGRectMake1(20,statusBarHeight+44+20+57+45, 22, 24);
    [_remPassBtn addTarget:self action:@selector(changeRemPass) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_remPassBtn];
    
    UILabel *remPassLab = [[UILabel alloc] initWithFrame:CGRectMake1(50,statusBarHeight+44+20+57+47, 80, 22)];
    remPassLab.text = @"记住密码";
    remPassLab.textColor = blackFontColor;
    remPassLab.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:remPassLab];
    
    UIButton *forgetPassBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [forgetPassBtn setTitle:NSLocalizedString(@"忘记密码？", nil) forState:UIControlStateNormal];
    [forgetPassBtn setTitleColor:yellowBgColor forState:UIControlStateNormal];
    [forgetPassBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
//    [forgetPassBtn setBackgroundColor:yellowBgColor];

    forgetPassBtn.frame = CGRectMake1(240, statusBarHeight+44+20+57+47, 60, 22);
    [forgetPassBtn addTarget:self action:@selector(forgetPass) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPassBtn];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_loginBtn setTitle:NSLocalizedString(@"确认登录", nil) forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [_loginBtn setBackgroundColor:mainOrangeColor];
    _loginBtn.layer.cornerRadius = 4.0;//圆角
    _loginBtn.frame = CGRectMake(20, self.view.frame.size.height-120, KSCreenW-40, 50);
//    _loginBtn.userInteractionEnabled=NO;//不可点击
//    _loginBtn.alpha=0.4;//变灰
    [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_loginBtn];
    
    _phoneFld.delegate = self;
    _passFld.delegate = self;
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
//- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}


-(void)changeRemPass{

    if(_isRemPass == 1){
        [_remPassBtn setBackgroundImage:[UIImage imageNamed:@"norempass.png"] forState:UIControlStateNormal];
        _isRemPass = 0;
    }else{
        [_remPassBtn setBackgroundImage:[UIImage imageNamed:@"rempass.png"] forState:UIControlStateNormal];
        _isRemPass = 1;
    }
}

- (void)forgetPass{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [[UINavigationBar appearance] setTintColor:mainOrangeColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    ForgetPassViewController *forgetPassViewController = [[ForgetPassViewController alloc] init];
    [self.navigationController pushViewController:forgetPassViewController animated:YES];
}

- (void)login{
    
    [DataTool login:_phoneFld.text withPass:_passFld.text fromView:self];
    

    
    return;
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:_phoneFld.text, @"username", _passFld.text, @"password", nil];
//    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer.timeoutInterval = 20;
//    [manager POST:LOGIN_URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject);
//        int code = [[(NSDictionary *)responseObject objectForKey:@"code"] intValue];
//        if(code != 100)
//        {
//            NSString * message = [(NSDictionary *)responseObject objectForKey:@"message"];
//            [self.view makeToast:message];
//            MyTabBarController *myTabBarController = [[MyTabBarController alloc] init];
////            self.navigationController.navigationBarHidden = YES;
//            [self presentViewController:myTabBarController animated:YES completion:nil];
//
//        }else{
//            
//            NSString * token = [(NSDictionary *)responseObject objectForKey:@"token"];//url中加入这个
//            NSDictionary *user = [(NSDictionary *)responseObject objectForKey:@"user"];
//            
//            NSDictionary *dict = [DataTool changeType:user];
//            NSLog(@"%@",dict);
//
//            NSString * userid = [dict objectForKey:@"uid"];
//            NSString * username = [dict objectForKey:@"username"];
//            NSString * department = [dict objectForKey:@"department"];
//            NSString * departmentName = [dict objectForKey:@"departmentName"];
//            NSString * img = [dict objectForKey:@"img"];
//            NSString * logo = [dict objectForKey:@"logo"];
//            NSString * name = [dict objectForKey:@"name"];
//            NSString * type = [dict objectForKey:@"type"];//1员工 2管理者
//
//            [userDefaults setObject:token forKey:@"token"];
//            [userDefaults setObject:userid forKey:@"id"];
//            [userDefaults setObject:username forKey:@"username"];
//            [userDefaults setObject:department forKey:@"department"];
//            [userDefaults setObject:type forKey:@"type"];
//            [userDefaults setObject:img forKey:@"img"];
//            [userDefaults setObject:logo forKey:@"logo"];
//            [userDefaults setObject:name forKey:@"name"];
//            [userDefaults setObject:departmentName forKey:@"departmentName"];
//            
//            [userDefaults synchronize];
//
//            
//            MyTabBarController *myTabBarController = [[MyTabBarController alloc] init];
////            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
////            [[UINavigationBar appearance] setTintColor:mainOrangeColor];
////            [self.navigationItem setBackBarButtonItem:backItem];
//            [self presentViewController:myTabBarController animated:YES completion:nil];
////            [self.navigationController popToRootViewControllerAnimated:YES];
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//        [self.view makeToast:@"登录失败"];
//        MyTabBarController *myTabBarController = [[MyTabBarController alloc] init];
//        [self presentViewController:myTabBarController animated:YES completion:nil];
//    }];
}

- (void)textFieldChanged{
    if(_passFld.text != nil & [_passFld.text length] != 0 ){
        _loginBtn.userInteractionEnabled=YES;//可点击
        _loginBtn.alpha=1;
    }else{
        _loginBtn.userInteractionEnabled=NO;
        _loginBtn.alpha=0.4;
    }
}

//关闭虚拟键盘。
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if(textField == _passFld){
        [_phoneFld resignFirstResponder];
        [_passFld resignFirstResponder];
    }
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_phoneFld resignFirstResponder];
    [_passFld resignFirstResponder];
    
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
