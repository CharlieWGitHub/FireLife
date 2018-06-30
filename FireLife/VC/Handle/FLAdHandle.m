//
//  FLAdHandle.m
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "FLAdHandle.h"
#import "HttpTool.h"
#import "AdModel.h"

@implementation FLAdHandle
#pragma mark 获取广告
+(void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success Failed:(FailedBlock)failed{
    [HttpTool getWithPath:API_AD params:nil success:^(id json) {
        NSLog(@"广告的：%@",json);
        if ([json[@"dm_error"] integerValue]) {
            failed(json[@"error_msg"]);
        } else {
            AdModel * model = [AdModel mj_objectWithKeyValues:json[@"resources"][0]];
            success(model);
        }
    } failure:^(NSError *error) {
        failed(error);

    }];
    
//    [HttpTool postWithPath:API_AD params:nil success:^(id json) {
//        NSLog(@"广告的：%@",json);
//        if ([json[@"dm_error"] integerValue]) {
//            failed(json[@"error_msg"]);
//        } else {
//            AdModel * model = [AdModel mj_objectWithKeyValues:json[@"resources"][0]];
//            success(model);
//        }
//    } failure:^(NSError *error) {
//          failed(error);
//    }];
    
}
@end
