//
//  PersonalHeadView.m
//  FireLife
//
//  Created by 王成龙 on 2018/7/9.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "PersonalHeadView.h"

@implementation PersonalHeadView

+(instancetype)loadHeadView{
    return [[[NSBundle mainBundle]loadNibNamed:@"PersonalHeadView" owner:self options:nil]lastObject];
}



@end
