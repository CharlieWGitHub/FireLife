//
//  QDNewPayTableViewCell.h
//  FireLife
//
//  Created by 王成龙 on 2018/8/10.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QDNewPayTableViewCell : UITableViewCell

/**
 分割线
 */
@property (nonatomic ,strong) UIImageView * lineImg;

/**
 支付渠道的图片
 */
@property (nonatomic ,strong) UIImageView * payMethodImg;

/**
 支付渠道名字
 */
@property (nonatomic ,strong) UILabel * payMethodName;

/**
 活动名称
 */
@property (nonatomic ,strong) UIButton * activityButton;

/**
 选择按钮
 */
@property (nonatomic ,strong) UIButton * selectedButton;

/**
 活动具体内容
 */
@property (nonatomic ,strong) UILabel * infoLab;


@end
