//
//  UserManagerTool.h
//  FireLife
//
//  Created by 王成龙 on 2018/7/2.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserManager;
@interface UserManagerTool : NSObject

//保存用户到文件 （归档用户） 登陆成功后调用
+ (void)saveUserManager:(UserManager *)userManager;

//从档案中取出这个用户
+ (UserManager *)userManager;

//从档案文件中删除这个用户  登出后调用此方法
+ (void)removeUserManager;

@end
