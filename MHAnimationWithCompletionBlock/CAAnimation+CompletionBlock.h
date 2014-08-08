//
//  CAAnimation+CompletionBlock.h
//  MHAnimationWithCompletionBlockDemo
//
//  Created by Haga Masaki on 2014/08/07.
//  Copyright (c) 2014年 Haga Masaki. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (CompletionBlock)

@property (nonatomic, strong) void (^completionBlock)();

@end
