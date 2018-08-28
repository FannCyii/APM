//
//  NSObject+RuntimeExtension.h
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/28.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RuntimeExtension)
+ (void)swizzleClass:(Class)aClass instanceSelector:(SEL)originSelector byNewSelector:(SEL)newSelector;
+ (void)swizzleClass:(Class)aClass classSelector:(SEL)originSelector byNewSelector:(SEL)newSelector;

- (void)switchInstanceSelector:(SEL)originSelector byNewSelector:(SEL)newSelector;
- (void)switchClassSelector:(SEL)originSelector byNewSelector:(SEL)newSelector;

@end
