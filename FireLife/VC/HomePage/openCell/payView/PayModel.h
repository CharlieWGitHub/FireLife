//
//  PayModel.h
//  FireLife
//
//  Created by 王成龙 on 2018/8/10.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
//签约类型
typedef NS_ENUM(NSUInteger, QDpayMode) {
    QDSignInModeAli    = 3, //支付宝
    QDSignInModeWX     = 4, //微信
    QDSignInModeUnion  = 5, //银联
    QDSignInModeQDBank = 6  //青岛银行
    
};
@interface PayModel : NSObject

/**
 名称
 */
@property (nonatomic ,copy)NSString * name;

/**
 活动名称
 */
@property (nonatomic ,copy)NSString *activity;

/**
 活动内容
 */
@property (nonatomic ,copy)NSString *info;

/**
 支付渠道
 */
@property (nonatomic ,assign)QDpayMode payMode;

/**
 是否默认选中
 */
@property (nonatomic ,assign) BOOL isSelected;

@end
