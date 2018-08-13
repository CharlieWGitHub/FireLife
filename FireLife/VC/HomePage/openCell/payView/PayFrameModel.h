//
//  PayFrameModel.h
//  FireLife
//
//  Created by 王成龙 on 2018/8/10.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PayModel.h"

@interface PayFrameModel : NSObject
/**
 支付渠道的图标的位置
 */
@property(nonatomic,assign)CGRect payImgFrame;

/**
 支付渠道名字的位置
 */
@property (nonatomic,assign)CGRect payNameFrame;

/**
 活动名称的位置
 */
@property (nonatomic ,assign)CGRect activityButtonFrame;

/**
 选择按钮的位置
 */
@property (nonatomic ,assign)CGRect selectButtonFrame;

/**
 分割线的位置
 */
@property (nonatomic ,assign) CGRect lineImgFrame;

/**
 活动内容的位置
 */
@property (nonatomic ,assign) CGRect infoLabFrame;
/**
 底部分割线
 */
@property (nonatomic ,assign) CGRect bottomLineFrame;
@property (nonatomic ,assign) CGRect unBottomLineFrame;

/**未展开的高度*/
@property(nonatomic,assign)CGFloat unExpandCellHeight;
/**展开的高度*/
@property(nonatomic,assign)CGFloat expandCellHeight;

@property (nonatomic ,strong)PayModel * payModel;

@end
