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

@interface OpenCellViewController ()<UITableViewDelegate,UITableViewDataSource,opencellDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong)NSMutableArray *dataSourceArr;
@end

@implementation OpenCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithHexString:@"#efeef5"];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.dataSourceArr = [NSMutableArray arrayWithCapacity:0];
    [self loadData];
    [self setupSubviews];
    // Do any additional setup after loading the view.
}
- (void)setupSubviews{
    UIView * view  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, lSCREEN_WIDTH, 122)];
    [view addSubview:[OpenCellHeadView creatOpenCellView]];
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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellFrameModel * frameModel = self.dataSourceArr[indexPath.row];
    if (frameModel.cellModel.isSelected) {
        return frameModel.expandCellHeight+20;
    }else{
        return frameModel.unExpandCellHeight+20;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QDLog(@"点击的是这个");
    //    CellFrameModel * model =self.dataSourceArr[indexPath.row];
//    model.cellModel.isSelected = !model.cellModel.isSelected;
//    NSIndexPath * indexPathnum = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
//    NSArray<NSIndexPath *> *indexpatharr = @[indexPathnum];
//    if (model.cellModel.isSelected) {
//        [tableView reloadRowsAtIndexPaths:indexpatharr withRowAnimation:UITableViewRowAnimationTop];
//    }else
//        [tableView reloadRowsAtIndexPaths:indexpatharr withRowAnimation:UITableViewRowAnimationBottom];
}
- (void)loadData{
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
    [self.tableView reloadData];
}
- (void)opencellButtonClick:(NSInteger)buttonTag{
    CellFrameModel * model =self.dataSourceArr[buttonTag];
    model.cellModel.isSelected = !model.cellModel.isSelected;
    [self.tableView reloadData];
   
//    NSIndexPath * indexPathnum = [NSIndexPath indexPathForRow:buttonTag inSection:0];
//    NSArray<NSIndexPath *> *indexpatharr = @[indexPathnum];
//    if (model.cellModel.isSelected) {
//        [self.tableView reloadRowsAtIndexPaths:indexpatharr withRowAnimation:UITableViewRowAnimationFade];
//    }else
//        [self.tableView reloadRowsAtIndexPaths:indexpatharr withRowAnimation:UITableViewRowAnimationFade];
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
