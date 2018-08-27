//
//  APMConfig.h
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/27.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APMConfig : NSObject

+ (instancetype)sharedInstence;

//Show FPS Label on keyWindow, defualt is NO.
@property(nonatomic, assign)BOOL showFPS;



@end
