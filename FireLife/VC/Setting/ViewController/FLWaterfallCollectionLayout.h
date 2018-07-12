//
//  FLWaterfallCollectionLayout.h
//  FireLife
//
//  Created by 王成龙 on 2018/7/12.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FLWaterfallCollectionLayout;

@protocol FLWaterfallCollectionLayoutDelegate <NSObject>

@required
//cell 的高度
- (CGFloat)waterFlowLayout:(FLWaterfallCollectionLayout*)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width;
@optional
//决定cell的列数
- (NSInteger)cloumnCountInWaterFlowLayout:(FLWaterfallCollectionLayout *)waterFlowLayout;

//决定cell 的列的距离
- (CGFloat)columMarginInWaterFlowLayout:(FLWaterfallCollectionLayout *)waterFlowLayout;

//决定cell 的行的距离
- (CGFloat)rowMarginInWaterFlowLayout:(FLWaterfallCollectionLayout *)waterFlowLayout;

//决定cell 的边缘距
- (UIEdgeInsets)edgeInsetInWaterFlowLayout:(FLWaterfallCollectionLayout *)waterFlowLayout;

@end

@interface FLWaterfallCollectionLayout : UICollectionViewLayout

@property (nonatomic ,weak) id <FLWaterfallCollectionLayoutDelegate>delegate;

- (NSInteger)columCount;
- (CGFloat)columMargin;
- (CGFloat)rowMargin;
- (UIEdgeInsets)defaultEdgeInsets;
@property (nonatomic) CGSize headerReferenceSize;

@end
