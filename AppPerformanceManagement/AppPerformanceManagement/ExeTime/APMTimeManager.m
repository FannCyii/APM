//
//  APMTimeManager.m
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/28.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "APMTimeManager.h"
#import <UIKit/UIKit.h>
#import "KIVLog.h"

@interface APMObjectTimeItem:NSObject
@property (nonatomic, assign) NSTimeInterval beginTime;
@property (nonatomic, assign) NSTimeInterval endTime;
@property (nonatomic, strong) NSString *objectKey;
@property (nonatomic, assign) BOOL hold;                //是否保持记录
@property (nonatomic, weak) id obj;                     //监控对象
@end

@implementation APMObjectTimeItem
@end


@interface APMTimeManager()
@property (nonatomic, strong) NSMutableDictionary<NSString *,APMObjectTimeItem *> *timeDic;
@property (nonatomic, strong) dispatch_queue_t timeManagerQueue;
@end

@implementation APMTimeManager

+ (instancetype)sharedInstance {
    static APMTimeManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APMTimeManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init{
    if (self = [super init]) {
        self.timeDic = [NSMutableDictionary dictionary];
        self.timeManagerQueue = dispatch_queue_create("kiv.apm.time.manager.queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)pushTimeWithObject:(id)obj{
    NSTimeInterval beiginTime = CACurrentMediaTime();
    dispatch_async(self.timeManagerQueue, ^{
        NSString *objKey = [NSString stringWithFormat:@"%p",obj];
        if (objKey.length == 0) {
            DLog(@"%@:对象地址不能为空",self);
            return;
        }
        [[KIVLog sharedInstance] condition:(objKey.length != 0) withDescription:@"" andLevel:LogLevelOfDEBUG];
        APMObjectTimeItem *timeItem = [self.timeDic objectForKey:objKey];
        if (!timeItem) {
            timeItem = [APMObjectTimeItem new];
            timeItem.obj = obj;
        }
        timeItem.beginTime = beiginTime;
        self.timeDic[objKey] = timeItem;
    });
}

- (void)popTimeWithObject:(id)obj{
    NSTimeInterval endTime = CACurrentMediaTime();
    dispatch_async(self.timeManagerQueue, ^{
        NSString *objKey = [NSString stringWithFormat:@"%p",obj];
        if (objKey.length == 0) {
            DLog(@"%@:对象不能为空",self);
            return;
        }
        APMObjectTimeItem *timeItem = [self.timeDic objectForKey:objKey];
        if (!timeItem) {
            return;
        }
        if (timeItem.hold) {
            timeItem.endTime = endTime;
            self.timeDic[objKey] = timeItem;
        }else{
            DLog(@"%@:time(s) = %0.4f",timeItem.obj,endTime - timeItem.beginTime);
            [self.timeDic removeObjectForKey:objKey];
        }
    });
}




@end
