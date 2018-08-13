//
//  OpenCellViewController.m
//  FireLife
//
//  Created by 王成龙 on 2018/8/6.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "OpenCellViewController.h"
#import "CellModel.h"
#import "CellFrameModel.h"
#import "CellTableViewCell.h"
#import "OpenCellHeadView.h"

#import "PayFrameModel.h"
#import "PayModel.h"
#import "QDNewPayTableViewCell.h"

@interface OpenCellViewController ()<UITableViewDelegate,UITableViewDataSource,opencellDelegate,payMethodSelectlDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray *dataSourceArr;
@property(nonatomic,strong) NSMutableArray *payDataSourceArr;

@end

@implementation OpenCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.dataSourceArr = [NSMutableArray arrayWithCapacity:0];
    self.payDataSourceArr = [NSMutableArray arrayWithCapacity:0];
   
    [self loadData];
    [self setupSubviews];
    
    // Do any additional setup after loading the view.
}
- (void)setupSubviews{
    
    UIView * view  = [[OpenCellHeadView alloc]initWithFrame:CGRectMake(0, 0, lSCREEN_WIDTH, 120)];
    UITableView * table = [[UITableView alloc]init];
    table.backgroundColor = [UIColor groupTableViewBackgroundColor];
    table.delegate      = self;
    table.dataSource    = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.tableHeaderView = view;
    [self.view addSubview:table];
    self.tableView       = table;
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return self.dataSourceArr.count;
    }else{
        return self.payDataSourceArr.count;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        static NSString * iden = @"iden";
        CellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
        if (!cell) {
            cell = [[CellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        }
        CellFrameModel * model = self.dataSourceArr[indexPath.row];
        cell.cellFrameModel = model;
        cell.arrButton.tag = indexPath.row;
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString * idenen = @"payIden";
        QDNewPayTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idenen];
        if (!cell) {
            cell = [[QDNewPayTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenen];
        }
        PayFrameModel * model = self.payDataSourceArr[indexPath.row];
        cell.payFrameModel = model;
        cell.selectedButton.tag = indexPath.row;
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        CellFrameModel * frameModel = self.dataSourceArr[indexPath.row];
        if (frameModel.cellModel.isSelected) {
            return frameModel.expandCellHeight+20;
        }else{
            return frameModel.unExpandCellHeight+20;
        }
    }else{
        PayFrameModel * payframeModel = self.payDataSourceArr[indexPath.row];
        if (payframeModel.payModel.isShow) {
            return payframeModel.expandCellHeight;
        }else{
            return payframeModel.unExpandCellHeight;
        }
    }
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==1) {
        QDLog(@"哈哈哈");
        PayFrameModel * model = self.payDataSourceArr[indexPath.row];
        model.payModel.isShow = !model.payModel.isShow;
        [self.tableView reloadData];
    }
}
- (void)loadData{
    //第一种布局
    NSString * arrStr = [[NSBundle mainBundle] pathForResource:@"cellPlist" ofType:@"plist"];
    NSArray * arrayay = [NSArray arrayWithContentsOfFile:arrStr];
    NSLog(@"%@",arrayay);
    for (NSDictionary * dic in arrayay) {
        CellModel * model = [[CellModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        CellFrameModel * modelFrame = [[CellFrameModel alloc]init];
        modelFrame.cellModel = model;
        [self.dataSourceArr addObject:modelFrame];
    }
    
//    第二种布局
    NSString * payarrStr = [[NSBundle mainBundle] pathForResource:@"PayList" ofType:@"plist"];
    NSArray * payDataArr = [NSArray arrayWithContentsOfFile:payarrStr];
    QDLog(@"000=%@",payDataArr);

    for (NSDictionary * dic in  payDataArr) {
        PayModel * model = [[PayModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        PayFrameModel * modelFrame = [[PayFrameModel alloc]init];
        modelFrame.payModel = model;
        [self.payDataSourceArr addObject:modelFrame];
    }
    
    [self.tableView reloadData];
}
//第一种cell的delegate
- (void)opencellButtonClick:(NSInteger)buttonTag{
    CellFrameModel * model = self.dataSourceArr[buttonTag];
    model.cellModel.isSelected = !model.cellModel.isSelected;
    [self.tableView reloadData];
}
-(void)payButtonClick:(NSInteger)buttonTag{
    for (int i=0; i<self.payDataSourceArr.count; i++) {
        PayFrameModel * mol = self.payDataSourceArr[i];
        if (i==buttonTag) {
            if (!mol.payModel.isSelected) {
                mol.payModel.isSelected = !mol.payModel.isSelected;
            }
        }else{
            mol.payModel.isSelected = NO;
        }
    }
    [self.tableView reloadData];
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
