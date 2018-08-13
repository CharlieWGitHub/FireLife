//
//  PayFrameModel.m
//  FireLife
//
//  Created by 王成龙 on 2018/8/10.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "PayFrameModel.h"
#import "CellHelp.h"

@implementation PayFrameModel

-(void)setPayModel:(PayModel *)payModel{
    _payModel = payModel;
    CGFloat magin = lSCREEN_HEIGHT <667?10:20;
    //  支付图标
    self.payImgFrame = CGRectMake(magin, 18, 35, 33);
    //  支付渠道名称
    self.payNameFrame = CGRectMake(CGRectGetMaxX(self.payImgFrame)+magin, 23, 95, 25);
    //  选择按钮
    self.selectButtonFrame = CGRectMake(lSCREEN_WIDTH - 24 -23, 25, 23, 23);
    //  文字的长度
    CGFloat activityBtnW = [CellHelp getStringWidth:payModel.activity andFont:14];
    //    活动按钮
    self.activityButtonFrame = CGRectMake(CGRectGetMaxX(self.selectButtonFrame)-activityBtnW -25 -20-10, 26, activityBtnW + 20, 20);
    
//  if (payModel.isShow)
        //   虚线
    self.lineImgFrame = CGRectMake(CGRectGetMaxX(self.payImgFrame)+10, CGRectGetMaxY(self.activityButtonFrame)+13, lSCREEN_WIDTH -35-magin-23-24-10, 2);
    CGFloat infoH   = [CellHelp getStringHeight:payModel.info andFont:14 andWidth:lSCREEN_WIDTH -35-magin-23-24];
        //   活动解释文字 高度得计算
    self.infoLabFrame = CGRectMake(self.lineImgFrame.origin.x, CGRectGetMaxY(self.lineImgFrame)+10, lSCREEN_WIDTH -35-magin-23-24, infoH);
        //    最下面的横线
    self.bottomLineFrame = CGRectMake(24, CGRectGetMaxY(self.infoLabFrame)+10, lSCREEN_WIDTH - 24 - 17, 1);
    self.unBottomLineFrame = CGRectMake(24, CGRectGetMaxY(self.activityButtonFrame)+25, lSCREEN_WIDTH -24 -17, 1);
    self.expandCellHeight   = CGRectGetMaxY(self.bottomLineFrame);
    self.unExpandCellHeight = CGRectGetMaxY(self.payImgFrame)+20;
    
    
//    }else{
//
//        self.bottomLineFrame = CGRectMake(24, CGRectGetMaxY(self.payImgFrame)+20, lSCREEN_WIDTH - 24 - 17, 1);
//        self.unExpandCellHeight = CGRectGetMaxY(self.bottomLineFrame);
//        self.expandCellHeight   = CGRectGetMaxY(self.bottomLineFrame);
//
//    }

  
    
}

@end
