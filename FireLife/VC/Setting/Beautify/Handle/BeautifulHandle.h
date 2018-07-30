//
//  BeautifulHandle.h
//  FireLife
//
//  Created by charlie on 2018/7/22.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BeautifulHandle : NSObject<NSCopying>

+ (instancetype) shareInstance;

/**
 黑白照片
 
 @param theOriginalImage 要处理的照片
 @return 处理完的照片
 */
- (UIImage *)convertUIImageBlackAndWhitePhotograph:(UIImage*)theOriginalImage;

/**
 高亮处理
 
 @param theOriginalImage 要处理的照片
 @return 处理完的照片
 */
- (UIImage *)convertUIImageToHighlightPhotograph:(UIImage *)theOriginalImage;
/**
 底色翻转
 
 @param theOriginalImage 要处理的照片
 @return 处理完的照片
 */
- (UIImage *)convertUIImageToColorflipPhotograph:(UIImage *)theOriginalImage;
/**
 将图片转化成像素
 
 @param image 将要转化 的图片
 @return 返回图片的data数据
 */
- (unsigned char*)convertUIImageToData:(UIImage *)image;
/**
 讲图片data数据还原成图片
 
 @param imageData 图片的data数据
 @param imageSource 图片-用来获取图片的宽高数据
 @return 返回处理的图片
 */
- (UIImage *)convertDataToUIImage:(unsigned char*)imageData image:(UIImage*)imageSource;

/*
 如何映射彩色RGB与灰度RGB
 gray = 0.299 * red + 0.587 * grenn + 0.114 * blue
 
 */
/**
 将彩色照片转换成灰色照片
 
 @param imageData 要转的图片的二进制数据
 @param width 图片的宽度
 @param height 图片的的高度
 @return 处理完成之后的数据
 */
- (unsigned char* )imageGrayWithData:(unsigned char*)imageData Width:(CGFloat)width height:(CGFloat)height;
/**
 彩色底板翻转
 
 @param imageData 图片的数据
 @param width 图片宽度
 @param height 图片高度
 @return 图片data数据
 */
- (unsigned char *)imageReColorWithData:(unsigned char*)imageData Width:(CGFloat)width Height:(CGFloat)height;
/**
 高亮 美白
 
 @param imageData 图片
 @param width 图片宽度
 @param height 图片高度
 @return 图片处理数据
 */
-  (unsigned char*)imageHightlightWithData:(unsigned char *)imageData width:(CGFloat)width Height:(CGFloat)height;

@end
