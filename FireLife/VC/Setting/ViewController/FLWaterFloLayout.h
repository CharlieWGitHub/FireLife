//
//  FLWaterFloLayout.h
//  FireLife
//
//  Created by 王成龙 on 2018/7/12.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FLWaterFloLayout;

@protocol FLWaterFloLayoutDelegate <NSObject>

@required
//cell 的高度
- (CGFloat)waterFlowLayout:(FLWaterFloLayout*)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width;
@optional
//决定cell的列数
- (NSInteger)cloumnCountInWaterFlowLayout:(FLWaterFloLayout *)waterFlowLayout;

//决定cell 的列的距离
- (CGFloat)columMarginInWaterFlowLayout:(FLWaterFloLayout *)waterFlowLayout;

//决定cell 的行的距离
- (CGFloat)rowMarginInWaterFlowLayout:(FLWaterFloLayout *)waterFlowLayout;

//决定cell 的边缘距
- (UIEdgeInsets)edgeInsetInWaterFlowLayout:(FLWaterFloLayout *)waterFlowLayout;

@end

@interface FLWaterFloLayout : UICollectionViewFlowLayout

@property (nonatomic ,weak) id <FLWaterFloLayoutDelegate>delegate;

- (NSInteger)columCount;
- (CGFloat)columMargin;
- (CGFloat)rowMargin;
- (UIEdgeInsets)defaultEdgeInsets;

@end
