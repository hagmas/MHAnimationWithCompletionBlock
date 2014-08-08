//
//  CALayer+CompletionBlock.m
//  MHAnimationWithCompletionBlockDemo
//
//  Created by Haga Masaki on 2014/08/07.
//  Copyright (c) 2014年 Haga Masaki. All rights reserved.
//

#import "CALayer+CompletionBlock.h"
#import "CAAnimation+CompletionBlock.h"
#import <objc/runtime.h>

@implementation CALayer (CompletionBlock)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(addAnimation:forKey:);
        SEL swizzledSelector = @selector(mh_addAnimation:forKey:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}


- (void)mh_addAnimation:(CAAnimation *)anim forKey:(NSString *)key {
    [CATransaction begin];
    [CATransaction setCompletionBlock:anim.completionBlock];
    [self mh_addAnimation:anim forKey:key];
    [CATransaction commit];
}

@end
