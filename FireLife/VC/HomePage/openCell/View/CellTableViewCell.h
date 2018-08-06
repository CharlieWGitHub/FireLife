//
//  CellTableViewCell.h
//  FireLife
//
//  Created by 王成龙 on 2018/8/6.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CellFrameModel;

@interface CellTableViewCell : UITableViewCell

@property (nonatomic ,strong) CellFrameModel * cellFrameModel;

/**
 背景框
 */
@property (nonatomic ,strong) UIView * backView;

/**
 渠道背景
 */
@property (nonatomic ,strong) UIImageView * signImg;

/**
 说明文字
 */
@property (nonatomic ,strong) UILabel * infoLab;

/**
 标题
 */
@property (nonatomic ,strong) UILabel * titleLab;
/**
 箭头
 */
@property (nonatomic ,strong) UIImageView * arrowImg;

@end
