//
//  AppDelegate.m
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "AppDelegate.h"
#import "FLTabBarViewController.h"
#import "AdView.h"
#import "UserManagerTool.h"
#import "LoginViewController.h"
#import "HomePageViewController.h"
#import "SettingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //根据归档是否有无userManager对象，选择不同的根控制器
    UserManager *userManager = [UserManagerTool userManager];
    if (userManager) {
        AdView * view = [AdView loadAdvertiseView];
        [self.window addSubview:view];
        
        FLTabBarViewController * main = [[FLTabBarViewController alloc]init];
        self.window.rootViewController = main;
        [self.window makeKeyAndVisible];
       
    } else {
      
        
        LoginViewController * vc = [[LoginViewController alloc]init];
        self.window.rootViewController = vc;
        
    }
        if (@available(iOS 9.1, *)) {
            UIApplicationShortcutIcon *iconFitness = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];
            //菜单文字
            UIMutableApplicationShortcutItem *itemFitness = [[UIMutableApplicationShortcutItem alloc] initWithType:@"1" localizedTitle:@"小超人"];
            
            //绑定信息到指定菜单
            itemFitness.icon = iconFitness;
            // 菜单图标
            //        UIApplicationShortcutIcon *iconRun = [UIApplicationShortcutIcon iconWithTemplateImageName:@"wxpay"];
            UIApplicationShortcutIcon * iconRun = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose];
            //菜单文字
            UIMutableApplicationShortcutItem *itemRun = [[UIMutableApplicationShortcutItem alloc] initWithType:@"2" localizedTitle:@"小魔兽"];
            //绑定信息到指定菜单
            itemRun.icon = iconRun;
            //绑定到App icon
            application.shortcutItems = @[itemFitness,itemRun];
        } else {
            
            // Fallback on earlier versions
        }
    // Override point for customization after application launch.
    return YES;
}
- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler{
    if ([shortcutItem.type isEqualToString:@"1"]) {
        //如果有导航栏参考下面注释部分
        UINavigationController *myNavi = self.window.rootViewController.childViewControllers[0];
        //        _tabBar.selectedIndex = 0;
        SettingViewController * picker1 = [[SettingViewController alloc]init];//进入窗口的初始化
        //利用NSUserDefaults 的标识，来防止重复初始化VC
        //    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"3d"]) {
        //       [myNavi popViewControllerAnimated:NO];
        //      [myNavi pushViewController:_picker1 animated:YES ];
        //    }else{
        [myNavi pushViewController:picker1 animated:YES ];
        
        //    }
        
    }
    if ([shortcutItem.type isEqualToString:@"2"]) {
        UINavigationController *myNavi = self.window.rootViewController.childViewControllers[1];
        HomePageViewController *vc = [[HomePageViewController alloc]init];//进入窗口的初始化
        [myNavi pushViewController:vc animated:YES ];
  
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
