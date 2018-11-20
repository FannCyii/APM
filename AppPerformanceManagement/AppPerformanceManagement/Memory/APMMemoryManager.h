//
//  APMMemoryManager.h
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/29.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APMMemoryManager : NSObject
+ (instancetype)sharedInstance;
- (void)noticeMemoryLeak:(id)leakObject;
- (void)trackObject:(id)obj;
@end
