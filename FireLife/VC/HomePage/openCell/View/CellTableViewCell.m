//
//  CellTableViewCell.m
//  FireLife
//
//  Created by 王成龙 on 2018/8/6.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "CellTableViewCell.h"

@implementation CellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatSubview];
    }
    return self;
}

- (void)creatSubview{
   
    self.backView = [[UIView alloc]init];
    self.backView.layer.borderColor = [[UIColor colorWithHexString:@"ooEE76" alpha:1] CGColor];
    self.backView.layer.borderWidth = 2.0f;
    self.backView.layer.cornerRadius = 5.0f;
    self.backView.layer.masksToBounds = true;
    [self.contentView addSubview:self.backView];
    
    self.signImg = [[UIImageView alloc]init];
    [self.backView addSubview:self.signImg];
    
    self.titleLab = [[UILabel alloc]init];
    self.titleLab.font = [UIFont systemFontOfSize:15];
    [self.backView addSubview:self.titleLab];
    
    self.infoLab = [[UILabel alloc]init];
    self.infoLab.font = [UIFont systemFontOfSize:15];
    [self.backView  addSubview:self.infoLab];
    
    self.arrowImg = [[UIImageView alloc]init];
    [self.backView addSubview:self.arrowImg];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
