//
//  FLTabBarViewController.m
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "FLTabBarViewController.h"
#import "FLTabBarView.h"
#import "FLNavigationViewController.h"
#import "LiveViewController.h"

@interface FLTabBarViewController ()<CL_TabbarDelegate>
@property (nonatomic ,strong) FLTabBarView * flTabbar;

@end

@implementation FLTabBarViewController
-(FLTabBarView *)flTabbar{
    if (!_flTabbar) {
        _flTabbar = [[FLTabBarView alloc]initWithFrame:CGRectMake(0, 0, lSCREEN_WIDTH, 49)];
        _flTabbar.delegate = self;
    }
    
    return _flTabbar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self makeVC];//加载控制器
    [self.tabBar addSubview:self.flTabbar];//加载tabbar
    // 解决tabbar 的阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
    // Do any additional setup after loading the view.
}
- (void)makeVC{
    
    NSMutableArray * array = [NSMutableArray arrayWithArray:@[@"HomePageViewController",@"SettingViewController"]];
    NSArray * titleArr = @[@"首页",@"个人中心"];
    for (NSInteger i =0; i<array.count; i++) {
        NSString  * vcName = array[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc]init];
        vc.navigationItem.title = titleArr[i];
        vc.view.backgroundColor = [UIColor whiteColor];
        FLNavigationViewController * nav = [[FLNavigationViewController alloc]initWithRootViewController:vc];
        //转变array 里的内容
        [array replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = array;
    
}
- (void)tababr:(FLTabBarView *)tabbar clickButton:(CLItemType)index {
    if (index !=CLItemTypeLive) {
        self.selectedIndex = index - CLItemTypeLive;
        return;
    }
    //莫泰视图
    LiveViewController * launch = [[LiveViewController alloc]init];
    [self presentViewController:launch animated:YES completion:nil];
    
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
