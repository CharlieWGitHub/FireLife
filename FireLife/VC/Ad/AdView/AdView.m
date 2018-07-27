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
    [self showAD];
    //下载广告
    [self inviteParent];
    //倒计时
    [self startTime];
}

- (void)showAD{
    //展示
    NSString * filename = [FLCacheHelp getAdvertise];
    NSString * filePath = [NSString stringWithFormat:@"%@",filename];
    //查看本地的缓存里面是否是有
    UIImage * lastCacheImage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
    
    if (lastCacheImage) {
        self.adImageView.image = lastCacheImage;
        NSLog(@"111");
    } else {
        NSLog(@"222");
        self.adImageView.image = [UIImage imageNamed:@"imag.png"];
        self.hidden = YES;
    }
}
-(void)judgeUpDateVersion{
    
    BOOL sameDateFlag = NO;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *nowday = [formatter stringFromDate:[NSDate date]];
    NSString *saveDay = [[NSUserDefaults standardUserDefaults] objectForKey:@"versionUpdateKey"];
    if (saveDay == nil) {
        saveDay = @"";
    }
    
    if (![saveDay isEqualToString:nowday]) { //假如不是同一天，更新存储的日期，并且把flag置为YES
        [[NSUserDefaults standardUserDefaults] setObject:nowday forKey:@"versionUpdateKey"];
        sameDateFlag = YES;
    }
    if (sameDateFlag) {
//        [self newVersionUpdateProcedure];
    }
}


- (void)inviteParent{
    
    
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDate *now = [NSDate date];
    NSDate *agoDate = [userDefault objectForKey:@"nowDate"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
  
    NSString *ageDateString = [dateFormatter stringFromDate:agoDate];
    NSString *nowDateString = [dateFormatter stringFromDate:now];
    if ([ageDateString isEqualToString:nowDateString]) {
        NSLog(@"一天一次");
        [self loadAD];
    }else{
        [self loadAD];
        //保存一下登录时间时间
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSDate *now = [NSDate date];
        [userDefault setObject:now forKey:@"nowDate"];
        [userDefault synchronize];
    }
    

}
- (void)loadAD{
 
    [FLAdHandle executeGetAdvertiseTaskWithSuccess:^(id obj) {
        AdModel * ad = obj;
        NSURL * imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@",ad.image]];
//         SDWebImageAvoidAutoSetImage  下载之后不赋值
        [[[SDWebImageManager sharedManager] imageDownloader]downloadImageWithURL:imageUrl options:SDWebImageDownloaderProgressiveDownload progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
            NSLog(@"下载成功");
//           保存本地
            [FLCacheHelp setAdvertise:ad.image];
        }];

    } Failed:^(id obj) {
        NSLog(@"失败：%@",obj);
    }];
  
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
