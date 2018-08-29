//
//  NSObject+APM_Extension.m
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/29.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "NSObject+APM_Extension.h"
#import "APMMemoryManager.h"

@implementation NSObject (APM_Extension)

- (void)apm_objectReleaseNotifaction{
    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf apm_objectNoReleaseAction];
    });
}

- (void)apm_objectNoReleaseAction{
    [[APMMemoryManager sharedInstance] noticeMemoryLeak:self];
}


@end
