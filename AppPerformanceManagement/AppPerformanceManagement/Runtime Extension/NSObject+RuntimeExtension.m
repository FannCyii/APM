//
//  NSObject+RuntimeExtension.m
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/28.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "NSObject+RuntimeExtension.h"
#import <objc/runtime.h>

@implementation NSObject (RuntimeExtension)

- (void)switchInstanceSelector:(SEL)originSelector byNewSelector:(SEL)newSelector{
    Class selfClass = self.class;
    [NSObject swizzleClass:selfClass instanceSelector:originSelector byNewSelector:newSelector];
}

- (void)switchClassSelector:(SEL)originSelector byNewSelector:(SEL)newSelector{
    Class selfClass = self.class;
    [NSObject swizzleClass:selfClass classSelector:originSelector byNewSelector:newSelector];
}

+ (void)swizzleClass:(Class)aClass instanceSelector:(SEL)originSelector byNewSelector:(SEL)newSelector{
    Method originMethod = class_getInstanceMethod(aClass, originSelector);
    Method newMethod = class_getInstanceMethod(aClass, newSelector);
    
    BOOL didAddMethod = class_addMethod(aClass, originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (didAddMethod) {
        class_replaceMethod(aClass, newSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    }else{
        method_exchangeImplementations(originMethod, newMethod);
    }
}

+ (void)swizzleClass:(Class)aClass classSelector:(SEL)originSelector byNewSelector:(SEL)newSelector{
    Method originMethod = class_getClassMethod(aClass, originSelector);
    Method newMethod = class_getClassMethod(aClass, newSelector);
    
    BOOL didAddMethod = class_addMethod(aClass, originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (didAddMethod) {
        class_replaceMethod(aClass, newSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    }else{
        method_exchangeImplementations(originMethod, newMethod);
    }
}






@end
