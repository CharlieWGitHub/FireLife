//
//  FLFMDBManager.h
//  FireLife
//
//  Created by charlie on 2018/7/26.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
@class personModel;
@interface FLFMDBManager : NSObject

+ (instancetype)shareInstence;
//创建FMDB
- (void)creatFMDB;
//增加数据
- (void)addOneRecords:(personModel*)person;
//删除
- (void)deleteOneRecord:(personModel*)person;
- (void)removeOneRecords:(personModel*)person;
//改
- (void)changeOneRecords:(personModel*)person;
//查
- (void)searchOneRecords;


@end
