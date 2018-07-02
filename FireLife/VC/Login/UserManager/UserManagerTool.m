//
//  UserManagerTool.m
//  FireLife
//
//  Created by 王成龙 on 2018/7/2.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "UserManagerTool.h"
#define saveFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]  stringByAppendingPathComponent:@"userManager.data"]

@implementation UserManagerTool
+ (UserManager *)userManager
{
    return (UserManager *)[NSKeyedUnarchiver unarchiveObjectWithFile:saveFilePath];
}
+ (void)saveUserManager:(UserManager *)userManager
{
    [NSKeyedArchiver archiveRootObject:userManager toFile:saveFilePath];
}
+ (void)removeUserManager
{
    NSFileManager *mgr = [[NSFileManager alloc] init];
    [mgr removeItemAtPath:saveFilePath error:nil];
}
@end
