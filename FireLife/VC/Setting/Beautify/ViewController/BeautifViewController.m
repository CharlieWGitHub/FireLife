//
//  BeautifViewController.m
//  FireLife
//
//  Created by 王成龙 on 2018/7/13.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "BeautifViewController.h"

@interface BeautifViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *beautImage;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollview;//待处理图片
@property (weak, nonatomic) IBOutlet UIButton *switchBtn;//切换按钮
@property (weak, nonatomic) IBOutlet UIScrollView *buttonSlideScrollView;//按钮滑动区
@property (weak, nonatomic) IBOutlet UIView *slideContenView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *slideContenViewWidth;


@end

@implementation BeautifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatBeautiImg];
    [self creatSlideScrollView];
}

- (void)creatSlideScrollView{
    NSArray * arr = @[@"Button_Bulb",@"Button_Cursor",@"Button_Cut",@"Button_Media",@"Button_Pen",@"Button_Pencil",@"Button_Reload",@"Button_Restore",@"Button_Ruler",@"Button_Shapes",@"Button_Shuffle",@"Button_Software",@"Button_Undo",@"Button_Wall"];
//    50*50
    for (int i=0; i<arr.count; i++) {
        UIButton * mbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        mbutton.frame = CGRectMake(30+i*70, 12, 50, 50);
        [mbutton setImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        [self.slideContenView addSubview:mbutton];
    }
    self.slideContenViewWidth.constant = 30+13*70 +50;
    [self.buttonSlideScrollView setContentSize:CGSizeMake(30+13*70 +50, 75)];

}
- (void)creatBeautiImg{
    _bgScrollview.delegate = self;
    self.beautImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image11.png"]];
    [self.bgScrollview addSubview:self.beautImage];
    self.bgScrollview.contentSize = self.beautImage.bounds.size;
    float xRate = self.bgScrollview.bounds.size.width / self.beautImage.bounds.size.width;
    float yRate = self.bgScrollview.bounds.size.height / self.beautImage.bounds.size.height;
    self.bgScrollview.minimumZoomScale = MIN(MIN(xRate, yRate), 0.5);
    self.bgScrollview.maximumZoomScale = 4.0;
    self.beautImage.center = self.bgScrollview.center;
}

//告诉scrollview要缩放的是哪个子控件
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _beautImage;
}
//缩放的时候调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    if(self.beautImage.frame.size.width >= self.bgScrollview.frame.size.width && self.beautImage.frame.size.height >= self.bgScrollview.frame.size.height){
        self.beautImage.frame = CGRectMake(0, 0, self.beautImage.frame.size.width, self.beautImage.frame.size.height);
    }
    if(self.beautImage.frame.size.width < self.bgScrollview.frame.size.width){
        self.beautImage.frame = CGRectMake((self.bgScrollview.frame.size.width-self.beautImage.frame.size.width)/2, self.beautImage.frame.origin.y, self.beautImage.frame.size.width, self.beautImage.frame.size.height);
    }
    if(self.beautImage.frame.size.height < self.bgScrollview.frame.size.height){
        self.beautImage.frame = CGRectMake(self.beautImage.frame.origin.x, (self.bgScrollview.frame.size.height-self.beautImage.frame.size.height)/2, self.beautImage.frame.size.width, self.beautImage.frame.size.height);
    }
}
//dismiss vc
- (IBAction)dismissViewContrller:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//保存照片到相册
- (IBAction)saveButtonClicked:(id)sender {
   
}
- (IBAction)changeBtn:(id)sender {

    NSLog(@"***");
    
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
