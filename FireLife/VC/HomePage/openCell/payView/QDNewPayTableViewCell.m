//
//  QDNewPayTableViewCell.m
//  FireLife
//
//  Created by 王成龙 on 2018/8/10.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "QDNewPayTableViewCell.h"

@implementation QDNewPayTableViewCell

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
    self.payMethodImg = [[UIImageView alloc]init];
    [self.contentView addSubview:self.payMethodImg];
    
    self.payMethodName = [[UILabel alloc]init];
    self.payMethodName.textColor = [UIColor colorWithHexString:@"0x666666"];
    self.payMethodName.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:self.payMethodName];
    
    self.lineImg = [[UIImageView alloc]init];
    self.lineImg.image = [UIImage imageNamed:@"dashline"];
    [self.contentView addSubview:self.lineImg];
    
    self.activityButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.activityButton.layer.cornerRadius = 10;
    self.activityButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.activityButton.layer.borderColor = [UIColor colorWithHexString:@"0xFC3838"].CGColor;
    self.activityButton.layer.borderWidth = 1;
    self.activityButton.layer.masksToBounds = YES;
    [self.activityButton setTitleColor:[UIColor colorWithHexString:@"0xFC3838"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.activityButton];
    
    self.infoLab = [[UILabel alloc]init];
    self.infoLab.font = [UIFont systemFontOfSize:14];
    self.infoLab.numberOfLines = 0;
    self.infoLab.textColor = [UIColor colorWithHexString:@"0x666666"];
    [self.contentView addSubview:self.infoLab];
    
    self.selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectedButton setImage:[UIImage imageNamed:@"payMode_normal"] forState:UIControlStateNormal];
    [self.selectedButton addTarget:self action:@selector(selectedButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.selectedButton];
    
    self.bottomImage  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"qcq_iconstep_line"]];
    [self.contentView addSubview:self.bottomImage];
    
}

-(void)setPayFrameModel:(PayFrameModel *)payFrameModel{
    _payFrameModel = payFrameModel;
    self.payMethodImg.frame = payFrameModel.payImgFrame;
    self.payMethodName.frame = payFrameModel.payNameFrame;
    self.selectedButton.frame = payFrameModel.selectButtonFrame;
    self.activityButton.frame = payFrameModel.activityButtonFrame;
    self.lineImg.frame = payFrameModel.lineImgFrame;
    [self.activityButton setTitle:payFrameModel.payModel.activity forState:UIControlStateNormal];

    switch (payFrameModel.payModel.payMode) {
        case 3:
            self.payMethodImg.image = [UIImage imageNamed:@"payMode_aliPay"];
            self.payMethodName.text = @"支付宝支付";
            break;
       case 4:
            self.payMethodImg.image = [UIImage imageNamed:@"payMode_wxPay"];
            self.payMethodName.text = @"微信支付";

            break;
        case 5:
            self.payMethodImg.image = [UIImage imageNamed:@"payMode_UnionPay"];
            self.payMethodName.text = @"银联支付";

            break;
        case 6:
            self.payMethodImg.image = [UIImage imageNamed:@"payMode_bqd"];
            self.payMethodName.text = @"青岛银行支付";

            break;
        default:
            break;
    }
    if (payFrameModel.payModel.isShow) {
        self.lineImg.hidden = NO;
        self.infoLab.hidden = NO;
        self.infoLab.frame = payFrameModel.infoLabFrame;
        self.bottomImage.frame = payFrameModel.bottomLineFrame;
        self.infoLab.text = payFrameModel.payModel.info;
    }else{
        self.bottomImage.frame = payFrameModel.unBottomLineFrame;
        self.lineImg.hidden = YES;
        self.infoLab.hidden = YES;
    }
    if (!payFrameModel.payModel.isSelected) {
        [self.selectedButton setImage:[UIImage imageNamed:@"payMode_normal"] forState:UIControlStateNormal];
    }else{
        [self.selectedButton setImage:[UIImage imageNamed:@"ticket_checkbox_checked"] forState:UIControlStateNormal];
    }
  
    
    
}
- (void)selectedButtonClicked:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(payButtonClick:)]) {
        [self.delegate payButtonClick:button.tag];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
