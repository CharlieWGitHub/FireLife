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

@interface OpenCellViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation OpenCellViewController
-(NSMutableArray *)dataSource{
    if (!self.dataSource) {
        self.dataSource = [NSMutableArray array];
    }
    return self.dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (void)setupSubviews{
   
    UITableView * table = [[UITableView alloc]init];
    table.delegate      = self;
    table.dataSource    = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * iden = @"iden";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
