//
//  FLBaseHandle.h
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
//处理事件成功--返回数据
typedef void(^SuccessBlock)(id obj);
//处理失败  --返回错误信息
typedef void(^FailedBlock)(id obj);

@interface FLBaseHandle : NSObject

@end
