//
//  FLExceptionHandle.h
//  FireLife
//
//  Created by 王成龙 on 2018/6/29.
//  Copyright © 2018年 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FLExceptionHandle : NSObject
{
    BOOL dismissed;
}
void HandleException(NSException *exception);
void SignalHandler(int signal);
void InstallUncaughtExceptionHandler(void);

@end
