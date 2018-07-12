//
//  SettingViewController.m
//  FireLife
//
//  Created by 王成龙 on 2018/6/28.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "SettingViewController.h"
#import "UserManagerTool.h"
#import "TestManagerConfig.h"
#import "CustomCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "PersonalHeadView.h"
#import "UIImage+Extension.h"
#import "FLWaterfallCollectionLayout.h"

@interface SettingViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,FLWaterfallCollectionLayoutDelegate>

@property (nonatomic ,strong) UICollectionView *myCollectionView;
@property (nonatomic ,strong) NSMutableArray *dateArray;
@property (nonatomic ,strong) PersonalHeadView *psesonalHeadView;

@end

@implementation SettingViewController
// 注意const的位置
static NSString *const cellId = @"CustomCollectionViewCell";
static NSString *const headerId = @"headerId";
static NSString *const footerId = @"footerId";

- (NSMutableArray *)dateArray{
    if (!_dateArray) {
        _dateArray = [[NSMutableArray alloc]init];
    }
    return _dateArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人中心";
//    [self creatLeft];
//    [self addTap];
    [self creatCollectionView];
    [self loadData];
    // Do any additional setup after loading the view.
}
- (void)loadData{
    
    
    [self.dateArray addObject:[UIImage imageNamed:@"imag.png"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image2.jpeg"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image1.jpeg"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image4.jpeg"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image3.jpeg"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image5.jpeg"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image6.png"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image7.jpeg"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image9.jpeg"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image8.jpeg"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image10.jpeg"]];
    [self.dateArray addObject:[UIImage imageNamed:@"image11.png"]];

    for (NSInteger i=0; i<self.dateArray.count; i++) {
         UIImage * temp = [UIImage imageCompressForWidthScale:self.dateArray[i] targetWidth:(lSCREEN_WIDTH-30)/2];
        [self.dateArray replaceObjectAtIndex:i withObject:temp];
    }
    
    [self.myCollectionView reloadData];
}
- (void)creatCollectionView{
 
    // 这个是系统提供的布局类，可以布局一些比较规则的布局。
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置每个item的大小，
//    flowLayout.itemSize = CGSizeMake((lSCREEN_WIDTH-30)/2, (lSCREEN_WIDTH-30)/2);
    // 设置列的最小间距
//    flowLayout.minimumInteritemSpacing = 5;
    // 设置最小行间距
//    flowLayout.minimumLineSpacing = 5;
    // 设置布局的内边距
//    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//    flowLayout.headerReferenceSize = CGSizeMake(lSCREEN_WIDTH, 225); //设置collectionView头视图的大小
    // 滚动方向
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
  
    FLWaterfallCollectionLayout * flowLayout = [[FLWaterfallCollectionLayout alloc]init];
    flowLayout.headerReferenceSize = CGSizeMake(lSCREEN_WIDTH, 225);
    flowLayout.delegate = self;
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, lSCREEN_WIDTH, lSCREEN_HEIGHT) collectionViewLayout:flowLayout];
    self.myCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.myCollectionView.dataSource = self;
    
    self.myCollectionView.delegate = self;
    [self.view addSubview:self.myCollectionView];
    
    // 注册cell、sectionHeader、sectionFooter
    [self.myCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellId];

    [self.myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [self.myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    
}
- (void)creatLeft{
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"退出登录" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClicked)];
}
- (void)addTap{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange:)];
    tap.numberOfTapsRequired = 6;
    [self.view addGestureRecognizer:tap];

}
//添加VIP
- (void)doTapChange:(UITapGestureRecognizer*)tap{
    [TestManagerConfig setupTestManager];
}
//退出登录
- (void)leftBarButtonItemClicked{
    [UserManagerTool removeUserManager];
}

#pragma mark - WaterFlowLayoutDelegate
- (CGFloat)waterFlowLayout:(FLWaterfallCollectionLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width{
    UIImage * temp = self.dateArray[index];
    return temp.size.height;
}

//决定cell的列数
- (NSInteger)cloumnCountInWaterFlowLayout:(FLWaterfallCollectionLayout *)waterFlowLayout
{
    return 2;
}
//决定cell 的列的距离
- (CGFloat)columMarginInWaterFlowLayout:(FLWaterfallCollectionLayout *)waterFlowLayout
{
    return 5;
}

//决定cell 的行的距离
- (CGFloat)rowMarginInWaterFlowLayout:(FLWaterfallCollectionLayout *)waterFlowLayout
{
    return 3;
}

//决定cell 的边缘距
- (UIEdgeInsets)edgeInsetInWaterFlowLayout:(FLWaterfallCollectionLayout *)waterFlowLayout
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


#pragma mark ---- UICollectionViewFlowLayoutDelegate
//itemSize属性
//设定全局的Cell尺寸，如果想要单独定义某个Cell的尺寸，可以使用下面方法：
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage * temp = self.dateArray[indexPath.row];
    QDLog(@"cell.height=%f",temp.size.height);
    return CGSizeMake((lSCREEN_WIDTH-30)/2, temp.size.height+55);
}
//minimumLineSpacing属性
//设定全局的行间距，如果想要设定指定区内Cell的最小行距，可以使用下面方法：
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//minimumInteritemSpacing属性
//设定全局的Cell间距，如果想要设定指定区内Cell的最小间距，可以使用下面方法：
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
#pragma mark ---- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dateArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [self.myCollectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor purpleColor];

    CustomCollectionViewCell *cell = [self.myCollectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.cellImage.image = self.dateArray[indexPath.row];
//    [cell.cellImage sd_setImageWithURL:[NSURL URLWithString:self.dateArray[indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeHold.jpeg"]];
    
    cell.cellLab.text = [NSString stringWithFormat:@"-第%ld个-",(long)indexPath.row];
    return cell;
}
- (void)addContent{
    PersonalHeadView * head = [PersonalHeadView loadHeadView];
    head.frame = CGRectMake(0, 0, lSCREEN_WIDTH, 225);
    self.psesonalHeadView = head;
}
// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [self.myCollectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
//        if(headerView == nil)
//        {
//            headerView = [[UICollectionReusableView alloc] init];
//        }
//        headerView.backgroundColor = [UIColor grayColor];
        /*****/
        [self addContent];
        [headerView addSubview: self.psesonalHeadView];
        return headerView;
    }
//    else if([kind isEqualToString:UICollectionElementKindSectionFooter])
//    {
//        UICollectionReusableView *footerView = [self.myCollectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerId forIndexPath:indexPath];
//        if(footerView == nil)
//        {
//            footerView = [[UICollectionReusableView alloc] init];
//        }
//        footerView.backgroundColor = [UIColor lightGrayColor];
//        return footerView;
//    }
    return nil;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
{
    
}

#pragma mark ---- UICollectionViewDelegate
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// 点击高亮
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
}
// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    QDLog(@"-------%ld--------",(long)indexPath.row);
}

// 长按某item，弹出copy和paste的菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// 使copy和paste有效
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"])
    {
        return YES;
    }
    return NO;
}
//copy and paste
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if([NSStringFromSelector(action) isEqualToString:@"copy:"])
    {
        [self.myCollectionView performBatchUpdates:^{
            [self.dateArray removeObjectAtIndex:indexPath.row];
            [self.myCollectionView deleteItemsAtIndexPaths:@[indexPath]];
        } completion:nil];
    }
    else if([NSStringFromSelector(action) isEqualToString:@"paste:"])
    {
        NSLog(@"-------------执行粘贴-------------");
        [self.myCollectionView performBatchUpdates:^{
//            [self.dateArray removeObjectAtIndex:indexPath.row];
//            [self.myCollectionView deleteItemsAtIndexPaths:@[indexPath]];
            [self.dateArray addObject:@"http://img.hb.aicdn.com/67188dcd699af791ec9f4702bf85158d14113d2115fbd-yXuhf3_fw658"];
            [self.myCollectionView insertItemsAtIndexPaths:@[indexPath]];
        } completion:nil];
        
    }
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
