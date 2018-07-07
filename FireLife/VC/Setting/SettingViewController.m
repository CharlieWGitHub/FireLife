//
//  SettingViewController.m
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "SettingViewController.h"
#import "UserManagerTool.h"
#import "TestManagerConfig.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    [self creatLeft];
    [self addTap];
    // Do any additional setup after loading the view.
}
- (void)creatLeft{
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"退出登录" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClicked)];
}
- (void)addTap{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange:)];
    tap.numberOfTapsRequired = 6;
    [self.view addGestureRecognizer:tap];

}
- (void)doTapChange:(UITapGestureRecognizer*)tap{
    [TestManagerConfig setupTestManager];
    
}
- (void)leftBarButtonItemClicked{
    [UserManagerTool removeUserManager];
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
