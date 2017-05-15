//
//  GiftOperation.m
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import "GiftOperation.h"
#import <UIKit/UIKit.h>

@interface GiftOperation()

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, copy) OPVoidBlock startBlock;
@property (nonatomic, copy) OPVoidBlock endBlock;

@end

@implementation GiftOperation

@synthesize finished = _finished;
@synthesize executing = _executing;

+ (instancetype)animateWithDuration:(NSTimeInterval)duration
                         startBlock:(OPVoidBlock)startBlock
                           endBlock:(OPVoidBlock)endBlock
{
    GiftOperation *op = [[GiftOperation alloc] init];
    op.duration = duration;
    op.startBlock = startBlock;
    op.endBlock = endBlock;
    return op;
}

- (void)start
{
    __weak typeof(self) weakSelf = self;
    if ([self isCancelled]) {
        _finished = YES;
        return;
    } else {
        _executing = YES;
        //start your task;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            weakSelf.startBlock();
            // 一次性，一条记录累计，不能多条记录累计。
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(weakSelf.duration/*延迟执行时间*/ * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                weakSelf.endBlock();
                weakSelf.finished = YES;
            });
        }];
        //end your task
    }
}

- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

@end
