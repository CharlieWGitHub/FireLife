//
//  FLTabBarView.m
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "FLTabBarView.h"
@interface FLTabBarView()

@property (nonatomic,strong) UIImageView * tabbarView;
@property (nonatomic,strong) NSArray * dataList;
@property (nonatomic,strong) UIButton * lastItem;
@property (nonatomic,strong) UIButton * cameraButton;

@end

@implementation FLTabBarView

-(NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}
- (UIButton *)cameraButton{
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        _cameraButton.tag = CLItemTypeLive;
        [_cameraButton sizeToFit];//固定宽高 自适应
        [_cameraButton addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}
-(UIImageView *)tabbarView{
    if (!_tabbarView) {
        _tabbarView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbarView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tabbarView];
        
        //        创建按钮
        for (NSUInteger i=0; i<self.dataList.count; i++) {
            UIButton * item = [UIButton buttonWithType:UIButtonTypeCustom];
            //不显示高亮状态
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[i]stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = CLItemTypeHomePage +i;
            if (i ==0) {
                item.selected = YES;
                self.lastItem = item;
            }
            [self addSubview:item];
            
        }
        //添加直播按钮
        [self addSubview:self.cameraButton];
        
    }
    return self;
}
-(void)layoutSubviews{
    
    self.tabbarView.frame = self.bounds;
    
    CGFloat width = self.bounds.size.width / self.dataList.count;
    
    for (NSInteger i=0; i<[self subviews].count; i++) {
        
        UIView * btn = [self subviews][i];
        if ([btn isKindOfClass:[UIButton class]]) {
            
            btn.frame = CGRectMake((btn.tag - CLItemTypeHomePage) * width, 0, width, self.frame.size.height);
            
        }
    }
    
    [self.cameraButton sizeToFit];
    self.cameraButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height-50);
    
}
-(void)itemClick:(UIButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(tababr:clickButton:)]) {
        [self.delegate tababr:self clickButton:button.tag];
    }
    
    if (button.tag != CLItemTypeLive) {
        
        self.lastItem.selected = NO;
        button.selected = YES;
        self.lastItem =button;
        
        //动画
        [UIView animateWithDuration:0.2 animations:^{
            //变大一下
            button.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                //恢复
                button.transform = CGAffineTransformIdentity;
                
            }];
        }];
        
    }else{
        button.adjustsImageWhenHighlighted = NO;
        
    }
    
    
    
}
@end
