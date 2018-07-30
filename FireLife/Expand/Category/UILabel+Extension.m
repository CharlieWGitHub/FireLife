//
//  UILabel+Extension.m
//  FireLife
//
//  Created by charlie on 2018/7/25.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (UILabel *(^)(CGFloat, CGFloat, CGFloat, CGFloat))setFrame{
    return ^(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
        self.frame = CGRectMake(x, y, width, height);
        return self;
    };
}
-(void)setSetFrame:(UILabel *(^)(CGFloat, CGFloat, CGFloat, CGFloat))setFrame{};
//外部设置，不想报警报 就写空方法
-(UILabel *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor * color){
        self.backgroundColor = color;
        return self;
    };
}
-(void)setSetBackgroundColor:(UILabel *(^)(UIColor *))setBackgroundColor{};
//文字
-(UILabel *(^)(NSString *))setText{
    return ^(NSString * text){
        self.text = text;
        return self;
    };
}
-(void)setSetText:(UILabel *(^)(NSString *))setText{};

- (UILabel *(^)(CGFloat))setTextFont{
    return ^(CGFloat textFont){
        self.setTextFont(textFont);
        return self;
    };
}
-(void)setSetTextFont:(UILabel *(^)(CGFloat))setTextFont{};

-(UILabel *(^)(UIColor *))setTextColor{
    return ^(UIColor * color){
        self.textColor = color;
        return self;
    };
}
- (void)setSetTextColor:(UILabel *(^)(UIColor *))setTextColor{};

-(UILabel *(^)(NSTextAlignment))setAlignment{
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}
- (void)setSetAlignment:(UILabel *(^)(NSTextAlignment))setAlignment{};


@end

