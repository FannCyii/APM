//
//  APMMemoryManager.m
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/29.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "APMMemoryManager.h"
#import <objc/runtime.h>

@interface APMMemoryManager()

@end

@implementation APMMemoryManager
+ (instancetype)sharedInstance {
    static APMMemoryManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APMMemoryManager alloc] init];
    });
    return sharedInstance;
}


- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

- (void)noticeMemoryLeak:(id)leakObject{
//    __weak typeof(leakObject)weakObj = leakObject;
    ELog(@"[内存泄漏]-%@",leakObject);
}

- (void)trackObject:(id)obj{
    const uint8_t *ivarLayout = class_getIvarLayout([obj class]);
    int i = 0;
    uint8_t tmpVar = ivarLayout[i];
    while (tmpVar != 0x00) {
        printf("x%02x\n",tmpVar);
        tmpVar = ivarLayout[++i];
    }
    
//    printf("%s",ivarLayout);
}



@end
