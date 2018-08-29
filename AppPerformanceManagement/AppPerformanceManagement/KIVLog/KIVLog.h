//
//  KIVLog.h
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/28.
//  Copyright © 2018年 cheng. All rights reserved.
//

/*
 日志打印
 
 日志级别：
 TRACE < DEBUG < INFO < WARN < ERROR
 
 */
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LogLevel) {
    LogLevelOfDEBUG = 1 << 0,
    LogLevelOfINFO  = 1 << 1,
    LogLevelOfWARN  = 1 << 2,
    LogLevelOfERROR = 1 << 3,
};

#define DLog(str...)  [[KIVLog sharedInstance] showLog:[NSString stringWithFormat:str] withLevel:LogLevelOfDEBUG]
#define ILog(str...) [[KIVLog sharedInstance] showLog:[NSString stringWithFormat:str] withLevel:LogLevelOfINFO]
#define WLog(str...) [[KIVLog sharedInstance] showLog:[NSString stringWithFormat:str] withLevel:LogLevelOfWARN]
#define ELog(str...) [[KIVLog sharedInstance] showLog:[NSString stringWithFormat:str] withLevel:LogLevelOfERROR]

#define DAssert(condition,des) [[KIVLog sharedInstance] condition:(condition) withDescription:(des) andLevel:LogLevelOfDEBUG]

@interface KIVLog : NSObject

+ (instancetype)sharedInstance;
@property (nonatomic, assign) LogLevel level;
@property (nonatomic, strong) NSString *logTitle;
- (void)showLog:(NSString *)log withLevel:(LogLevel)aLevel;
- (void)condition:(BOOL)condition withDescription:(NSString *)description andLevel:(LogLevel )aLevel;
@end
