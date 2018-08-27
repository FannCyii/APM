//
//  KIVFPSManager.h
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/27.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KIVFPSManager : NSObject
+ (instancetype)sharedInstence;
@property(nonatomic, assign, readonly) NSInteger fps;

@property(nonatomic, assign)BOOL showFPSLabel;

@end
