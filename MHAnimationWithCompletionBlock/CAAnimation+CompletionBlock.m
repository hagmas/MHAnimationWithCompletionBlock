//
//  CAAnimation+CompletionBlock.m
//  MHAnimationWithCompletionBlockDemo
//
//  Created by Haga Masaki on 2014/08/07.
//  Copyright (c) 2014年 Haga Masaki. All rights reserved.
//

#import "CAAnimation+CompletionBlock.h"
#import <objc/runtime.h>

@implementation CAAnimation (CompletionBlock)

@dynamic completionBlock;

- (void)setCompletionBlock:(void (^)())completionBlock {
    objc_setAssociatedObject(self, @selector(completionBlock), completionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)())completionBlock {
    return objc_getAssociatedObject(self, @selector(completionBlock));
}

@end
