//
//  ViewController.m
//  MHAnimationWithCompletionBlockDemo
//
//  Created by Haga Masaki on 2014/08/07.
//  Copyright (c) 2014年 Haga Masaki. All rights reserved.
//

#import "ViewController.h"
#import "MHAnimationWithCompletionBlock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CABasicAnimation* animWithCompletionBlock = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animWithCompletionBlock.fromValue = (__bridge id)([UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0].CGColor);
    animWithCompletionBlock.toValue = (__bridge id)([UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0].CGColor);
    animWithCompletionBlock.duration = 1.0f;
    animWithCompletionBlock.completionBlock = ^(void){
        NSLog(@"The completion block was called.");
    };
    
    [self.view.layer addAnimation:animWithCompletionBlock forKey:@""];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
