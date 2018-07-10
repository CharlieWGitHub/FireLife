//
//  PersonalHeadView.h
//  FireLife
//
//  Created by 王成龙 on 2018/7/9.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalHeadView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *likesLab;
@property (weak, nonatomic) IBOutlet UILabel *followLab;
@property (weak, nonatomic) IBOutlet UILabel *browseLab;

+ (instancetype)loadHeadView;

@end
