//
//  CellFrameModel.h
//  FireLife
//
//  Created by 王成龙 on 2018/8/6.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CellModel.h"
#import "CellHelp.h"

@interface CellFrameModel : NSObject

/**
 背景
 */
@property(nonatomic,assign)CGRect backViewFrame;
@property(nonatomic,assign)CGRect backViewFrame2;

/**
 箭头
 */
@property(nonatomic,assign)CGRect arrowFrame;


/**
 标题
 */
@property (nonatomic ,assign)CGRect titleFrame;

/**
 文字
 */
@property(nonatomic,assign)CGRect infolabFrame;

/**
 渠道图片
 */
@property (nonatomic ,assign)CGRect signImgFrame;
/**
 签约渠道背景
 */
@property(nonatomic,assign)CGRect answerFrame;


//未展开的高度
@property(nonatomic,assign)CGFloat unExpandCellHeight;
//展开的高度
@property(nonatomic,assign)CGFloat expandCellHeight;

@property(nonatomic,strong)CellModel *cellModel;
@end
