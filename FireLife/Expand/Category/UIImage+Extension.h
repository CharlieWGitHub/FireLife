//
//  UIImage+Extension.h
//  FireLife
//
//  Created by 王成龙 on 2018/7/11.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 指定区域放大
 
 @param sourceImage 图片源数据
 @param size 放大区域
 @return 处理后的图片
 */
+ (UIImage *) imageCompressFitSizeScale:(UIImage *)sourceImage targetSize:(CGSize)size;

/**
 指定宽度放大
 
 @param sourceImage 图片源数据
 @param defineWidth 指定宽度
 @return 处理后的图片
 */
+ (UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
@end
