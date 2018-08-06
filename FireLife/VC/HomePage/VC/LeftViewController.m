//
//  LeftViewController.m
//  FireLife
//
//  Created by charlie on 2018/7/26.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "LeftViewController.h"
#import "FLHomeHandle.h"
#import "FLFMDBManager.h"
#import "personModel.h"

@interface LeftViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textF;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [[FLFMDBManager shareInstence]creatFMDB];
    
}

- (IBAction)checked:(id)sender {

    if (![FLHomeHandle validateIdentityCard:self.textF.text]) {
        NSLog(@"请填写正确身份证号码");
    }else{
        NSLog(@"正确身份证号码");
    }
}
- (IBAction)addPerson:(id)sender {
    personModel * model = [[personModel alloc]init];
    model.ID = 13;
    model.name = @"charlie";
    model.age  = 12;
    [[FLFMDBManager shareInstence]addOneRecords:model];
    
}
- (IBAction)delPerson:(id)sender {
    
    [[FLFMDBManager shareInstence]deleteOneRecord:nil];
    
}
- (IBAction)changePerson:(id)sender {
    personModel * model = [[personModel alloc]init];
    model.ID = 12;
    model.name = @"charlie";
    model.age  = 120;
    [[FLFMDBManager shareInstence]changeOneRecords:model];
    
}
- (IBAction)findPerson:(id)sender {
    [[FLFMDBManager shareInstence] searchOneRecords];
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
