//
//  FLFMDBManager.m
//  FireLife
//
//  Created by charlie on 2018/7/26.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "FLFMDBManager.h"
#import <FMDB.h>
#import "personModel.h"

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
    [db close];
};
/**
 增删改查中 除了查询（executeQuery），其余操作都用（executeUpdate）
 //1.sql语句中跟columnname 绑定的value 用 ？表示，不加‘’，可选参数是对象类型如：NSString，不是基本数据结构类型如：int，方法自动匹配对象类型
 - (BOOL)executeUpdate:(NSString*)sql, ...;
 //2.sql语句中跟columnname 绑定的value 用%@／%d表示，不加‘’
 - (BOOL)executeUpdateWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
 //3.sql语句中跟columnname 绑定的value 用 ？表示的地方依次用 (NSArray *)arguments 对应的数据替代
 - (BOOL)executeUpdate:(NSString*)sql withArgumentsInArray:(NSArray *)arguments;
 //4.同3 ，区别在于多一个error指针，记录更新失败
 - (BOOL)executeUpdate:(NSString*)sql values:(NSArray * _Nullable)values error:(NSError * _Nullable __autoreleasing *)error;
 //5.同3，区别在于用 ？ 表示的地方依次用(NSDictionary *)arguments中对应的数据替代
 - (BOOL)executeUpdate:(NSString*)sql withParameterDictionary:(NSDictionary *)arguments;
 - (BOOL)executeUpdate:(NSString*)sql withVAList: (va_list)args;
 */
//0.直接sql语句
//    BOOL result = [db executeUpdate:@"insert into 't_student' (ID,name,phone,score) values(110,'x1','11',83)"];
//1.
//    BOOL result = [db executeUpdate:@"insert into 't_student'(ID,name,phone,score) values(?,?,?,?)",@111,@"x2",@"12",@23];
//2.
//    BOOL result = [db executeUpdateWithFormat:@"insert into 't_student' (ID,name,phone,score) values(%d,%@,%@,%d)",112,@"x3",@"13",43];
//3.


- (void)addOneRecords:(personModel*)person{
    [self.db open];

    [self.db beginTransaction];
    NSDate * begin = [NSDate date];
    BOOL rollBack = NO;
    @try {
        
        NSString * name = person.name;
        int ID          = person.ID;
        int age         = person.age;
        BOOL result = [self.db executeUpdate:@"INSERT INTO t_student (ID,name,age) VALUES (?,?,?);", @(ID),name,@(age)];
        if (result) {
            QDLog(@"插入成功");
        }else{
            QDLog(@"%@",[self.db lastError].description);
        }
    }
    @catch (NSException *exception){
        // 在事物中执行失败，退回开启事事务之前的状态
        rollBack = YES;
        [self.db rollback];
    }
    @finally {
        rollBack = NO;
        [self.db commit];
    }
    NSDate *end = [NSDate date];
    NSTimeInterval time = [end timeIntervalSinceDate:begin];
    QDLog(@"事务中执行任务需要的时间 =%f",time);
    [self.db close];
    
}

- (void)deleteOneRecord:(personModel*)person{
    [self.db open];
    
    BOOL result = [self.db executeUpdate:@"delete from 't_student' where ID = ?" withArgumentsInArray:@[@12]];
    if (result) {
        QDLog(@"delete from 't_student' success");
    } else {
        QDLog(@"%@",[self.db lastError].description);
    }
    [self.db close];

}
- (void)removeOneRecords:(personModel*)person{
    
    [self.db executeUpdate:@"DROP TABLE IF EXISTS t_student;"];
    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
    
}
- (void)changeOneRecords:(personModel*)person{
    [self.db open];
    int ID = person.ID;
    BOOL result = [self.db executeUpdate:@"UPDATE 't_student' SET NAME = ? WHERE ID = ?"withArgumentsInArray:@[@"HHH",@(ID)]];
    if (result) {
        QDLog(@"update seccess");
    }else{
        QDLog(@"update error=%@",[self.db lastError].description);
    }
    [self.db close];
}
-(void)searchOneRecords{
    [self.db open];
    // 1.执行查找语句
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_student"];
    // 2.遍历结果
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"ID"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"%d %@ %d", ID, name, age);
    }
    [self.db close];
}
@end
