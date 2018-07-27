//
//  HomePageViewController.m
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "HomePageViewController.h"
#import "Person.h"
#import "UILabel+Extension.h"
#import "LeftViewController.h"

@interface HomePageViewController ()
@property (nonatomic,assign) BOOL isFinish;

@end

@implementation HomePageViewController

- (void)creatView{
    
    UILabel * lab = [[UILabel alloc]init];
    lab.setBackgroundColor([UIColor yellowColor]).setText(@"今天天气很好啊适合出去玩").setAlignment(NSTextAlignmentLeft).setTextColor([UIColor redColor]);
    [self.view addSubview:lab];
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(64);
        make.left.mas_equalTo(self.view.mas_left).mas_offset(10);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(60);
    }];
    
}
- (void) creatTime{
    if (@available(iOS 10.0, *)) {
        //        runloop 有5种模式
        /*
         NSDefaultRunLoopMode  --- 默认模式：处理网络事件，timer;
         UITrackingRunLoopMode --- UI模式  ：处理UI事件
         NSRunLoopCommonModes  --- 占位模式 ：
         */
        NSThread * thread = [[NSThread alloc] initWithBlock:^{
            NSTimer * time = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeRunMethed) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop]addTimer:time forMode:NSDefaultRunLoopMode];
            
            //死循环 开启一个runloop
            //        while (!self->_isFinish) {
            //            [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.0001]];
            //
            //        }
            [[NSRunLoop currentRunLoop]run];
        }];
        
        [thread start];
    } else {
        // Fallback on earlier versions
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    [self creatView];
    [self creatTime];
    
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(leftClicked)];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)leftClicked{
    LeftViewController * left = [[LeftViewController alloc]init];
    left.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:left animated:YES];
}
//time 中不建议处理耗时操作 一但耗时操作，子线程做
- (void)timeRunMethed{
    //退出当前线程-子线程
    if (_isFinish) {
        NSLog(@"哥们走了");
        [NSThread exit];
        NSLog(@"bey bey");
    }
    NSLog(@"come here");
    static int num;
    NSLog(@"%d",num++);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    退出主线程 不会挂掉子线程的打印
//    [NSThread exit];
    self.isFinish = YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
