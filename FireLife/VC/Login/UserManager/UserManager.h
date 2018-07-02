//
//  UserManager.h
//  FireLife
//
//  Created by 王成龙 on 2018/7/2.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject
+ (UserManager *)manager;
+ (instancetype)userManagerWithDic:(NSDictionary*)dict;

@end
