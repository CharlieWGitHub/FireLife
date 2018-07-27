//
//  FLFMDBManager.h
//  FireLife
//
//  Created by charlie on 2018/7/26.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLFMDBManager : NSObject

+ (instancetype)shareInstence;
//创建FMDB
- (void)creatFMDB;
//增加数据
- (void)addOneRecords;
//删除
- (void)removeOneRecords;
//改
- (void)changeOneRecords;
//查
- (void)searchOneRecords;


@end
