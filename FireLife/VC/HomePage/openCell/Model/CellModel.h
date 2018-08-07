//
//  CellModel.h
//  FireLife
//
//  Created by 王成龙 on 2018/8/6.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
//签约类型
typedef NS_ENUM(NSUInteger, QDSignInMode) {
    QDSignInModeAli    = 3, //支付宝
    QDSignInModeWX     = 4, //微信
    QDSignInModeUnion  = 5, //银联
    QDSignInModeQDBank = 6  //青岛银行
    
};

@interface CellModel : NSObject

/**
 是否被选中
 */
@property (nonatomic ,assign) BOOL isSelected;
/**
 文字说明
 */
@property (nonatomic ,copy  ) NSString * infoLab;

/**
 标题
 */
@property (nonatomic ,copy  ) NSString * titleLab;
 /**
 图片名字
 */
@property (nonatomic ,copy  ) NSString * imageName;

/**
 签约类型
 */
@property (nonatomic ,copy) NSString * signMode;

/**
 color
 */
@property (nonatomic ,copy) NSString * borderColor;

/**
 是否显示
 */
//@property (nonatomic ,assign) BOOL isShow;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
