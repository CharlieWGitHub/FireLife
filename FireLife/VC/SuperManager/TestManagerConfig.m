//
//  TestManagerConfig.m
//  FireLife
//
//  Created by 王成龙 on 2018/7/5.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "TestManagerConfig.h"
@interface TestManagerConfig()<ZYTestManagerDelegate>

@end

@implementation TestManagerConfig
static TestManagerConfig *_instance;
+ (instancetype)shareInstance
{
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[TestManagerConfig alloc] init];
        });
    }
    return _instance;
}
+ (void)setupTestManager
{
    // delegate (optation)
    //    [ZYTestManager shareInstance].delegate = [TestManagerConfig shareInstance];
    // show TestManager' suspensionView
    [ZYTestManager showSuspensionView];
    // Set resident test items
    NSArray *baseArray = @[
                           @{
                               kTestTitleKey: @"开发环境",
                               kTestAutoCloseKey: @YES,
                               kTestActionKey: ^{
                                   NSLog(@"开发环境");
                               }
                               },
                           @{
                               kTestTitleKey: @"测试环境",
                               kTestAutoCloseKey: @YES,
                               kTestActionKey: ^{
                                   NSLog(@"测试环境");
                               }
                               },
                           @{
                               kTestTitleKey: @"线上环境",
                               kTestAutoCloseKey: @YES,
                               kTestActionKey: ^{
                                   NSLog(@"线上环境");
                               }
                               },
                           @{
                               kTestTitleKey:@"取消",
                               kTestAutoCloseKey: @YES,
                               kTestActionKey:^{
                                   NSLog(@"取消");
                                   [ZYTestManager removeSuspensionView];
                               }
                               },
                           ];
    
    [ZYTestManager setupPermanentTestItemArray:baseArray];
}
#pragma -mark 切换服务器
- (void) connectToTheServer:(int)serverCode
{
    
    
}

@end
