//
//  OpenCellHeadView.m
//  FireLife
//
//  Created by 王成龙 on 2018/8/8.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "OpenCellHeadView.h"

@implementation OpenCellHeadView

+ (instancetype)creatOpenCellView{
    return [[[NSBundle mainBundle]loadNibNamed:@"OpenCellHeadView" owner:self options:nil]lastObject];
}

@end
