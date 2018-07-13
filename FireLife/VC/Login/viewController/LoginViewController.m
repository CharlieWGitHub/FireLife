//
//  LoginViewController.m
//  FireLife
//
//  Created by 王成龙 on 2018/7/2.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "LoginViewController.h"
#import "FLTabBarViewController.h"
#import "UserManager.h"
#import "UserManagerTool.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginClicked:(id)sender {
//  登录 - 成功 - 保存信息
    UserManager * user =  [UserManager userManagerWithDic:@{@"user_id":@"11",@"user_name":@"tom"}];
    [UserManagerTool saveUserManager:user];
    
    FLTabBarViewController * main = [[FLTabBarViewController alloc]init];
    [[[[UIApplication sharedApplication]delegate]window]setRootViewController:main];
    [[[[UIApplication sharedApplication]delegate]window] makeKeyAndVisible];
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
