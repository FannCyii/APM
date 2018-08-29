//
//  UINavigationController+APM_Extension.m
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/29.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "UINavigationController+APM_Extension.h"
#import "NSObject+RuntimeExtension.h"
#import "NSObject+APM_Extension.h"

@implementation UINavigationController (APM_Extension)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self switchInstanceSelector:@selector(popViewControllerAnimated:) byNewSelector:@selector(apm_popViewControllerAnimated:)];
    });
}

- (UIViewController *)apm_popViewControllerAnimated:(BOOL)animated{
    UIViewController *poppedVc = [self apm_popViewControllerAnimated:animated];
    [poppedVc apm_objectReleaseNotifaction];
    return poppedVc;
}

@end
