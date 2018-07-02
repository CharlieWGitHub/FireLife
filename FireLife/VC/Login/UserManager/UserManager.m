//
//  UserManager.m
//  FireLife
//
//  Created by 王成龙 on 2018/7/2.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "UserManager.h"
@interface UserManager()
@property (nonatomic,strong) NSString *user_id;
@property (nonatomic,strong) NSString *user_name;

@end
@implementation UserManager

+(UserManager *)manager{
    static UserManager * _manager;
    if (_manager == nil) {
        _manager = [[UserManager alloc]init];
    }
    return _manager;
}
+ (instancetype)userManagerWithDic:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary*)dict{
    if (self = [super init]) {
        self.user_id = dict[@"user_id"];
        self.user_name = dict[@"user_name"];
    }
    return self;
}
//归档解档用
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.user_id forKey:@"user_id"];
    [encoder encodeObject:self.user_name forKey:@"user_name"];
}
- (instancetype)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.user_id = [decoder decodeObjectForKey:@"user_id"];
        self.user_name = [decoder decodeObjectForKey:@"user_name"];
    }
    return self;
}
@end
