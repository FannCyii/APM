//
//  UIViewController+APM_Extension.m
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/28.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "UIViewController+APM_Extension.h"
#import "NSObject+RuntimeExtension.h"
#import "APMTimeManager.h"
#import "NSObject+APM_Extension.h"

@implementation UIViewController (APM_Extension)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self switchInstanceSelector:@selector(viewDidLoad) byNewSelector:@selector(apm_viewDidLoad)];
        [self switchInstanceSelector:@selector(viewDidAppear:) byNewSelector:@selector(apm_viewDidAppear:)];
        [self switchInstanceSelector:@selector(dismissViewControllerAnimated:completion:) byNewSelector:@selector(apm_dismissViewControllerAnimated:completion:)];
    });
}


- (void)apm_viewDidLoad{
    APMTimeBegin(self);
    [self apm_viewDidLoad];
}

- (void)apm_viewDidAppear:(BOOL)animated{
    [self apm_viewDidAppear:animated];
    APMTimeEnd(self);
}

- (void)apm_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    [self apm_dismissViewControllerAnimated:flag completion:completion];
    [self apm_objectReleaseNotifaction];
}


@end
