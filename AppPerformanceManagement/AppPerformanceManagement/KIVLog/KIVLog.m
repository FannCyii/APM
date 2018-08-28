//
//  KIVLog.m
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/28.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "KIVLog.h"


@interface KIVLog()

@end

@implementation KIVLog

+ (instancetype)sharedInstance {
    static KIVLog *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[KIVLog alloc] init];
        sharedInstance.logTitle = @"[APM]";
        sharedInstance.level = LogLevelOfDEBUG;
    });
    return sharedInstance;
}

- (const char *)title{
    return [self.logTitle UTF8String];
}


- (void)logWithString:(NSString *)string{
    printf("%s %s\n",[self title],[string UTF8String]);
}
//这里最终改成 面向接口编程，提供不同的日志策略来显示日志
- (BOOL)levelStrategyWith:(LogLevel)level{
    //策略1
    if (self.level == level) {
        return YES;
    }
//    //策略2
//    if (self.level < level) {
//        return YES;
//    }
    
    //策略3
    //是否断言等
    
    return NO;
}

- (void)showLog:(NSString *)log withLevel:(LogLevel)aLevel{
    if (![self levelStrategyWith:aLevel]) {
        return;
    }
    [self logWithString:log];
}

- (void)condition:(BOOL)condition withDescription:(NSString *)description andLevel:(LogLevel )aLevel{
    if (condition) {
        return;
    }
    [self showLog:description withLevel:aLevel];
}


@end
