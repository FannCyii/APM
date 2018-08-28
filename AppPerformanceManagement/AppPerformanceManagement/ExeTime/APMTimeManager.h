//
//  APMTimeManager.h
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/28.
//  Copyright © 2018年 cheng. All rights reserved.
//

#define APMTimeBegin(obj) [[APMTimeManager sharedInstance] pushTimeWithObject:(obj)]
#define APMTimeEnd(obj) [[APMTimeManager sharedInstance] popTimeWithObject:(obj)]

#import <Foundation/Foundation.h>

@interface APMTimeManager : NSObject

+ (instancetype)sharedInstance;

- (void)pushTimeWithObject:(id)obj;
- (void)popTimeWithObject:(id)obj;



@end
