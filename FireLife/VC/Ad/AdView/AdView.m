//
//  AdView.m
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "AdView.h"
#import "FLCacheHelp.h"
#import "FLAdHandle.h"
#import "AdModel.h"
#import "SDWebImageManager.h"

@interface AdView()
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (nonatomic,strong) dispatch_source_t timer;

@end

@implementation AdView
+(instancetype)loadAdvertiseView{
    return [[[NSBundle mainBundle]loadNibNamed:@"AdView" owner:self options:nil] lastObject];
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.frame = [UIScreen mainScreen].bounds;
    //展示广告
//    [self showAD];
    //下载广告
//    [self loadAD];
    //倒计时
//    [self startTime];
}

- (void)showAD{
    //展示
//    NSString * filename = [FLCacheHelp getAdvertise];
//    NSString * filePath = [NSString stringWithFormat:@"%@",filename];
/*
    //查看本地的缓存里面是否是有
    UIImage * lastCacheImage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
    
    if (lastCacheImage) {
        self.backView.image = lastCacheImage;
        NSLog(@"111");
    } else {
        NSLog(@"222");
        self.hidden = YES;
    }
 */
}

- (void)loadAD{
 
//    [FLAdHandle executeGetAdvertiseTaskWithSuccess:^(id obj) {
//        AdModel * ad = obj;
//        NSURL * imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@",ad.image]];
        // SDWebImageAvoidAutoSetImage  下载之后不赋值
//        [[[SDWebImageManager sharedManager] imageDownloader]downloadImageWithURL:imageUrl options:SDWebImageDownloaderProgressiveDownload progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
//            NSLog(@"下载成功");
////           保存本地
//            [FLCacheHelp setAdvertise:ad.image];
//        }];
//
//    } Failed:^(id obj) {
//        NSLog(@"失败：%@",obj);
//    }];
  
}
- (void)startTime{
    
    __block NSUInteger timeout = 4;
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        //回到主线程
        if (timeout <=0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
            
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.timeLab.text = [NSString stringWithFormat:@"跳过时间%zd",timeout];
            });
            
            timeout -- ;
        }
    });
    dispatch_resume(timer);
    
    
}

- (void)dismiss{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha =0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
@end
