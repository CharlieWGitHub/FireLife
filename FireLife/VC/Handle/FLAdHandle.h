//
//  FLAdHandle.h
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "FLBaseHandle.h"

@interface FLAdHandle : FLBaseHandle

//获取广告
+ (void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success Failed:(FailedBlock)failed;


@end
