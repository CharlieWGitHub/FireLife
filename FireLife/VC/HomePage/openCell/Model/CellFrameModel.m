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
    CGFloat cwidth  = lSCREEN_WIDTH -40;
    CGFloat cheight = (lSCREEN_WIDTH-40)/4.4;
//   是否可以展示优惠活动
    if (cellModel.isShow) {
        //计算文字高度：
        CGFloat infoH   = [CellHelp getStringHeight:cellModel.infoLab andFont:15 andWidth:cwidth-20];
        //背景图 宽高比4.4
        //背景
        self.signImgFrame = CGRectMake(0, 0, cwidth, cheight);
        //说明标题
        self.titleFrame = CGRectMake(5, CGRectGetMaxY(self.signImgFrame), cwidth, 30);
        self.buttonFrame = CGRectMake(10, CGRectGetMaxY(self.signImgFrame)+10, cwidth, 30);
        //没有展开的高度
        self.unExpandCellHeight = cheight + 30+20;
        self.arrowFrame = CGRectMake(cwidth - 30, cheight+5, 15, 15);
        //info
        self.infolabFrame = CGRectMake(10, cheight + 35, cwidth-20, infoH);
        //  展开的高度
        self.expandCellHeight = cheight + 30 + infoH +20;
        
        self.backViewFrame = CGRectMake(20, 20, cwidth, cheight + 35);
        self.backViewFrame2 = CGRectMake(20, 20, cwidth, cheight +35 + infoH + 10);
    }else{
        self.signImgFrame = CGRectMake(0, 0, cwidth, cheight);
        self.unExpandCellHeight = cheight+10;
        self.backViewFrame = CGRectMake(20, 20, cwidth, cheight);
    }
    
    
}

@end
