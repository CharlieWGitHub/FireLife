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
    self.signImg.image = [UIImage imageNamed:@"qcq_btn_unionpay"];
    [self.backView addSubview:self.signImg];
    
    self.titleLab = [[UILabel alloc]init];
    self.titleLab.font = [UIFont systemFontOfSize:15];
    [self.backView addSubview:self.titleLab];
    
    self.infoLab = [[UILabel alloc]init];
    self.infoLab.font = [UIFont systemFontOfSize:15];
    self.infoLab.numberOfLines = 0;
    [self.backView  addSubview:self.infoLab];
    
    self.arrowImg = [[UIImageView alloc]init];
    self.arrowImg.image = [UIImage imageNamed:@"arrowdown"];
    [self.backView addSubview:self.arrowImg];
    
}
- (void)setCellFrameModel:(CellFrameModel *)cellFrameModel{
    _cellFrameModel = cellFrameModel;
   
    self.titleLab.frame = cellFrameModel.titleFrame;
    self.arrowImg.frame = cellFrameModel.arrowFrame;
    self.signImg .frame = cellFrameModel.signImgFrame;
    self.infoLab.frame  = cellFrameModel.infolabFrame;
    
    self.titleLab.text = cellFrameModel.cellModel.titleLab;
    self.infoLab.text  = cellFrameModel.cellModel.infoLab;
    self.signImg.image = [UIImage imageNamed:cellFrameModel.cellModel.imageName];
    
    self.backView.layer.borderColor = [UIColor colorWithHexString:cellFrameModel.cellModel.borderColor].CGColor;
    
    if (cellFrameModel.cellModel.isSelected) {
        self.arrowImg.image = [UIImage imageNamed:@"arrowTop"];
        self.backView.frame = cellFrameModel.backViewFrame2;
    }else{
        self.arrowImg.image = [UIImage imageNamed:@"arrowdown"];
        self.backView.frame = cellFrameModel.backViewFrame;
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
