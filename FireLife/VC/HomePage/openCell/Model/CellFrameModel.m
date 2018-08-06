//
//  CellFrameModel.m
//  FireLife
//
//  Created by 王成龙 on 2018/8/6.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "CellFrameModel.h"

@implementation CellFrameModel

- (void)setCellModel:(CellModel *)cellModel{
    _cellModel = cellModel;
    //背景图 宽高比4.4
    self.backViewFrame = CGRectMake(20, 10, lSCREEN_WIDTH-40, 40);
    //说明标题
    
    
    
}

@end
