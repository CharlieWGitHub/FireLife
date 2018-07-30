//
//  Person.h
//  FireLife
//
//  Created by charlie on 2018/7/24.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (void)eat;
- (void)run;

- (Person*)eatApple;
- (Person*)runOneMeter;

- (Person *(^)(NSString*))eatFood;
- (Person *(^)(NSInteger))sleep;


@end
