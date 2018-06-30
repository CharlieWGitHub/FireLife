//
//  FLCacheHelp.m
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "FLCacheHelp.h"
#define advertiseImage @"adImage"

@implementation FLCacheHelp
//取出来
+(NSString *)getAdvertise{
    return [[NSUserDefaults standardUserDefaults]objectForKey:advertiseImage];
}
//保存本地
+ (void)setAdvertise:(NSString *)adImage{
    [[NSUserDefaults standardUserDefaults]setObject:adImage forKey:advertiseImage];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
