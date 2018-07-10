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

@interface SettingViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

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
    [self.dateArray addObject:@"http://img.hb.aicdn.com/cabd7ee62c515c282a768dc67b818afb351dd1c72a2f0-7iYrbH_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/da55759b61d8ea2db3f57238c811c73ae717a15626a18-RjSIC9_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/9098435a6d3bf2ad7631dae59a9c10e53fda34121ebfd-qbGBQk_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/8bd99fb182aa67fb3293591f972eafdf1ffaa51b3ff16-tT5NV3_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/edaafcf9e748d9868141340b7c1f74d04f1dd98320a51-YunUvl_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/64e32be0e30f97deb1d0ffd0b81e9ee71508e83a1a2a8-PHwRPR_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/6a292b16942b8dc642b8fcf479b4f1a301972a031d4cc-bHVERx_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/912520dc69b27647723c44b067af8c3dd368fda411dff-OhZwwz_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/9075d2e4349aabefce0fbb379939961c34773b17cfd2-uzNelJ_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/fbc51c590c2e19774c6382a98de14db0efcba2041d2a2-tWEsm1_fw658"];
    [self.dateArray addObject:@"http://img.hb.aicdn.com/9f1526091b1c0daf4c755b1ef848a0354676415a1ba13-hmhvFu_fw658"];
    
    [self.myCollectionView reloadData];
}
- (void)creatCollectionView{
    // 这个是系统提供的布局类，可以布局一些比较规则的布局。
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置每个item的大小，
    flowLayout.itemSize = CGSizeMake((lSCREEN_WIDTH-30)/2, (lSCREEN_WIDTH-30)/2);
    // 设置列的最小间距
    flowLayout.minimumInteritemSpacing = 5;
    // 设置最小行间距
    flowLayout.minimumLineSpacing = 5;
    // 设置布局的内边距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.headerReferenceSize=CGSizeMake(lSCREEN_WIDTH, 225); //设置collectionView头视图的大小
    // 滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
   
//    PersonalHeadView * view = [PersonalHeadView loadHeadView];
//    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, lSCREEN_WIDTH, 285)];
//    view1 = view;
//    [self.view addSubview:view1];
    
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, lSCREEN_WIDTH, lSCREEN_HEIGHT) collectionViewLayout:flowLayout];
    self.myCollectionView.backgroundColor = [UIColor whiteColor];
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
    [cell.cellImage sd_setImageWithURL:[NSURL URLWithString:self.dateArray[indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeHold.jpeg"]];
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
    cell.backgroundColor = [UIColor greenColor];
    
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
