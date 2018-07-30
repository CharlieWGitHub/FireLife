//
//  Person.m
//  FireLife
//
//  Created by charlie on 2018/7/24.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat{
    NSLog(@"%s",__func__);
}
-(void)run{
    NSLog(@"%s",__func__);
}
-(Person *)eatApple{
    NSLog(@"%s",__func__);
    return self;
}
- (Person *)runOneMeter{
    NSLog(@"%s",__func__);
    return self;
}

-(Person *(^)(NSString *))eatFood{
    Person * (^eatFoodBlock)(NSString *) = ^(NSString *food){
        NSLog(@"吃个%@",food);
        return self;
    };
    return eatFoodBlock;
}
- (Person *(^)(NSInteger))sleep{
    Person * (^sleepBlock)(NSInteger) = ^(NSInteger time){
        NSLog(@"困了 睡一觉 %ld分钟",(long)time);
        return self;
    };
    return sleepBlock;
}

@end
