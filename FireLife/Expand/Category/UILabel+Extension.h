//
//  UILabel+Extension.h
//  FireLife
//
//  Created by charlie on 2018/7/25.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 设置背景颜色
 */
@property (nonatomic ,copy)UILabel*(^setBackgroundColor)(UIColor *color);

/**
 设置位置
 */
@property (nonatomic ,copy)UILabel*(^setFrame)(CGFloat x,CGFloat y,CGFloat width,CGFloat height);

/**
 设置内容
 */
@property (nonatomic ,copy)UILabel*(^setText)(NSString *text);

/**
 设置字体大小
 */
@property (nonatomic ,copy)UILabel*(^setTextFont)(CGFloat font);

/**
 设置字体颜色
 */
@property (nonatomic ,copy)UILabel*(^setTextColor)(UIColor *color);

/**
 设置对齐方式
 */
@property (nonatomic ,copy)UILabel*(^setAlignment)(NSTextAlignment alignment);

@end
