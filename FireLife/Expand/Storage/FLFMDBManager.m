//
//  FLFMDBManager.m
//  FireLife
//
//  Created by charlie on 2018/7/26.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "FLFMDBManager.h"
#import <FMDB.h>

@interface FLFMDBManager()
@property (nonatomic ,strong)FMDatabase * db;
@end

@implementation FLFMDBManager

static id flFMDBManager;

+(instancetype)shareInstence{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        flFMDBManager = [[super alloc]init];
    });
    return flFMDBManager;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        flFMDBManager = [super allocWithZone:zone];
    });
    return flFMDBManager;
}
-(id)copyWithZone:(NSZone *)zone{
    return flFMDBManager;
}

- (void)creatFMDB{
    //数据库的路径
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName=[doc stringByAppendingPathComponent:@"student.sqlite"];
    //获取数据库
    FMDatabase * db = [FMDatabase databaseWithPath:fileName];

    //打开数据库
    if ([db open]) {
        //建表
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL)"];
        if (result) {
            NSLog(@"创建成功");
        }else{
            NSLog(@"创建失败");
        }
        
    }
    self.db = db;
    
};

- (void)addOneRecords{
    NSString * name = @"cl";
    [self.db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?, ?);", name, @(arc4random_uniform(40))];
    
};

- (void)removeOneRecords{
    [self.db executeUpdate:@"DROP TABLE IF EXISTS t_student;"];
    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
};
- (void)changeOneRecords{};
-(void)searchOneRecords{
    // 1.执行查找语句
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_student"];
    // 2.遍历结果
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"%d %@ %d", ID, name, age);
    }
    

};
@end
