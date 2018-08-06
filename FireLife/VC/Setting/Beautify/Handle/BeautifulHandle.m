//
//  BeautifulHandle.m
//  FireLife
//
//  Created by charlie on 2018/7/22.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "BeautifulHandle.h"

@implementation BeautifulHandle
static id beautifulHandle;
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        beautifulHandle = [[super alloc]init];
    });
    return beautifulHandle;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        beautifulHandle = [super allocWithZone:zone];
    });
    return beautifulHandle;
}
-(id)copyWithZone:(NSZone *)zone{
    return beautifulHandle;
}

//黑白
-(UIImage *)convertUIImageBlackAndWhitePhotograph:(UIImage *)theOriginalImage{
    
    unsigned char * iamgeData = [self convertUIImageToData:theOriginalImage];
    unsigned char * imageNewData =[self imageGrayWithData:iamgeData Width:theOriginalImage.size.width height:theOriginalImage.size.height];
    UIImage * newImage = [self convertDataToUIImage:imageNewData image:theOriginalImage];
    return newImage;
    
}
//高亮
-(UIImage *)convertUIImageToHighlightPhotograph:(UIImage *)theOriginalImage{
    unsigned char * iamgeData = [self convertUIImageToData:theOriginalImage];
    unsigned char * imageNewData =[self imageHightlightWithData:iamgeData width:theOriginalImage.size.width Height:theOriginalImage.size.height];
    UIImage * newImage = [self convertDataToUIImage:imageNewData image:theOriginalImage];
    return newImage;
}
//颜色翻转
-(UIImage *)convertUIImageToColorflipPhotograph:(UIImage *)theOriginalImage{
    unsigned char * iamgeData = [self convertUIImageToData:theOriginalImage];
    unsigned char * imageNewData = [self imageReColorWithData:iamgeData Width:theOriginalImage.size.width Height:theOriginalImage.size.height];
    UIImage * newImage = [self convertDataToUIImage:imageNewData image:theOriginalImage];
    return newImage;
    
}
/**
 将图片转化成像素
 
 @param image 将要转化 的图片
 @return 返回图片的data数据
 */
- (unsigned char*)convertUIImageToData:(UIImage *)image{
    
    CGImageRef imageref = [image CGImage];
    CGSize image_size = image.size;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //图片的每个像素点对应4个Byte R G B A 像素点个数 = 宽 * 高
    //malloc 内存分配
    void * data = malloc(image_size.width * image_size.height *4);
    
    CGContextRef context = CGBitmapContextCreate(data, image_size.width, image_size.height, 8, 4*image_size.width, colorSpace, kCGImageAlphaNoneSkipLast|kCGBitmapByteOrder32Big);
    //渲染 --uiimage -->data
    CGContextDrawImage(context, CGRectMake(0, 0, image_size.width, image_size.height), imageref);
    
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    return (unsigned char *)data;
    
}

/**
 讲图片data数据还原成图片
 
 @param imageData 图片的data数据
 @param imageSource 图片-用来获取图片的宽高数据
 @return 返回处理的图片
 */
- (UIImage *)convertDataToUIImage:(unsigned char*)imageData image:(UIImage*)imageSource{
    
    CGFloat width = imageSource.size.width;
    CGFloat height = imageSource.size.height;
    NSInteger dataLength = width * height * 4;
    
    CGDataProviderRef provide = CGDataProviderCreateWithData(NULL, imageData, dataLength, NULL);
    
    int bitsPerComponent = 8;
    int bitsPerPixel = 32;
    int BytesPerRow = 4*width;
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
    CGColorRenderingIntent renderIntent = kCGRenderingIntentDefault;
    
    CGImageRef imageRef = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, BytesPerRow , colorSpaceRef, bitmapInfo, provide, NULL, NO, renderIntent);
    
    UIImage * imageNew = [UIImage imageWithCGImage:imageRef];
    CFRelease(imageRef);
    CGColorSpaceRelease(colorSpaceRef);
    CGDataProviderRelease(provide);
    
    return imageNew;
    
}
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
- (unsigned char* )imageGrayWithData:(unsigned char*)imageData Width:(CGFloat)width height:(CGFloat)height{
    //1 分配内存空间 == image = w*h*4
    unsigned char * resultData = malloc(width * height * sizeof(unsigned char)*4);
    //内存空间清零
    memset(resultData, 0, width * height * sizeof(unsigned char)*4);
    for (int h =0; h < height; h++) {
        for (int w=0; w< width; w++) {
            //取出每个像素值
            unsigned int imageIndex = h * width  +w;
            //每一个像素是RGBA = 4Bit
            unsigned char bitMapRed = *(imageData + imageIndex*4);
            unsigned char bitMapGrenn = *(imageData + imageIndex*4+1);
            unsigned char bitMapBlue = *(imageData + imageIndex*4+2);
            //            根据YUV的颜色空间中，Y的分量的物理意义是点的亮度，由该值反映亮度等级，根据RGB和YUV颜色空间的变化关系可建立亮度Y与R、G、B三个颜色分量的对应：Y=0.3R+0.59G+0.11B，以这个亮度值表达图像的灰度值
            int bitMap = bitMapRed * 77/255 + bitMapGrenn * 151/255 + bitMapBlue * 88/255;
            unsigned char newBitMap = (bitMap>255)?255:bitMap;
            
            memset(resultData + imageIndex*4, newBitMap, 1);
            memset(resultData + imageIndex*4+1, newBitMap, 1);
            memset(resultData + imageIndex*4+2, newBitMap, 1);
        }
    }
    
    return resultData;
}

/**
 彩色底板翻转
 
 @param imageData 图片的数据
 @param width 图片宽度
 @param height 图片高度
 @return 图片data数据
 */
- (unsigned char *)imageReColorWithData:(unsigned char*)imageData Width:(CGFloat)width Height:(CGFloat)height{
    //1 分配内存空间 == image = w*h*4
    unsigned char * resultData = malloc(width * height * sizeof(unsigned char)*4);
    //初始化内存空间（*把刚刚分配的内存空间 进行初始化*）
    memset(resultData, 0, width * height * sizeof(unsigned char)*4);
    
    for (int h =0; h < height; h++) {
        for (int w=0; w< width; w++) {
            //取出每个内存中的像素值
            unsigned int imageIndex = h * width  +w;
            //每一个像素是RGBA = 4Bit
            unsigned char bitMapRed = *(imageData + imageIndex*4);
            unsigned char bitMapGreen = *(imageData + imageIndex*4+1);
            unsigned char bitMapBlue = *(imageData + imageIndex*4+2);
            //每一个像素是RGBA = 翻转
            unsigned char bitMapRedNew = 255-bitMapRed;
            unsigned char bitMapGreenNew = 255-bitMapGreen;
            unsigned char bitMapBlueNew = 255-bitMapBlue;
            
            memset(resultData + imageIndex*4, bitMapRedNew, 1);
            memset(resultData + imageIndex*4+1, bitMapGreenNew, 1);
            memset(resultData + imageIndex*4+2, bitMapBlueNew, 1);
        }
    }
    return resultData;
}
/*
 \\
 最小二乘法曲线拟合
 公式推导
 MATLAB
 深度学习
 映射表
 \\
 */
-  (unsigned char*)imageHightlightWithData:(unsigned char *)imageData width:(CGFloat)width Height:(CGFloat)height{
    //1 分配内存空间 == image = w*h*4
    unsigned char * resultData = malloc(width * height * sizeof(unsigned char)*4);
    //内存空间清零
    memset(resultData, 0, width * height * sizeof(unsigned char)*4);
    //选择8个点
    NSArray * colorArrayBase = @[@"55",@"110",@"155",@"185",@"220",@"240",@"250",@"255"];
    //    差值算法
    NSMutableArray * colorArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    int beforeNum =0;
    for (int i =0; i<8; i++) {
        NSString * numberString = [colorArrayBase objectAtIndex:i];
        int num = numberString.intValue;
        float step =0;
        if (i==0) {
            step = num/32.0;
            beforeNum = num;
        }else{
            step = (num - beforeNum)/32.0;
        }
        for (int j=0; j<32; j++) {
            int newNum = 0;
            if (i==0) {
                newNum = (int)(j * step);
            } else {
                newNum = (int)(j*step + beforeNum);
            }
            NSString * newNumStr = [NSString stringWithFormat:@"%d",newNum];
            [colorArray addObject:newNumStr];
        }
        beforeNum = num;
    }
    
    for (int h =0; h < height; h++) {
        for (int w=0; w< width; w++) {
            //取出每个像素值
            unsigned int imageIndex = h * width  +w;
            //每一个像素是RGBA = 4Bit
            unsigned char bitMapRed = *(imageData + imageIndex*4);
            unsigned char bitMapGreen = *(imageData + imageIndex*4+1);
            unsigned char bitMapBlue = *(imageData + imageIndex*4+2);
            
            NSString * redStr = [colorArray objectAtIndex:bitMapRed];
            NSString * greenStr = [colorArray objectAtIndex:bitMapGreen];
            NSString * blueStr = [colorArray objectAtIndex:bitMapBlue];
            //每一个像素是RGBA 翻转
            unsigned char bitMapRedNew = redStr.intValue;
            unsigned char bitMapGreenNew = greenStr.intValue;
            unsigned char bitMapBlueNew = blueStr.intValue;
            
            memset(resultData + imageIndex*4, bitMapRedNew, 1);
            memset(resultData + imageIndex*4+1, bitMapGreenNew, 1);
            memset(resultData + imageIndex*4+2, bitMapBlueNew, 1);
            
        }
    }
    
    return resultData;
    
}



@end
