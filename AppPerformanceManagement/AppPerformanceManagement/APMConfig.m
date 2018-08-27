//
//  APMConfig.m
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/27.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "APMConfig.h"
#import "KIVFPSManager.h"

@interface APMConfig()

@end

@implementation APMConfig

+ (instancetype)sharedInstence{
    static APMConfig *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[APMConfig alloc] init];
    });
    return manager;
}

- (void)setShowFPS:(BOOL)showFPS{
    _showFPS = showFPS;
    [KIVFPSManager sharedInstence].showFPSLabel = showFPS;
}



@end
