//
//  FLHomeHandle.m
//  FireLife
//
//  Created by charlie on 2018/7/26.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "FLHomeHandle.h"

@implementation FLHomeHandle
+ (BOOL)validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

@end
