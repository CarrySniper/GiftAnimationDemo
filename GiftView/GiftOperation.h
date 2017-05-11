//
//  GiftOperation.h
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^OPVoidBlock)();

@interface GiftOperation : NSOperation

/**
 多线程队列操作
 
 @param duration 动画时间（礼物出现+展示+消失时间一致）
 @param startBlock 开始回调
 @param endBlock 结束回调
 @return Operation
 */
+ (instancetype)animateWithDuration:(NSTimeInterval)duration
                         startBlock:(OPVoidBlock)startBlock
                           endBlock:(OPVoidBlock)endBlock;

@end

/*
 使用方法
 NSOperationQueue *_opQueue = [[NSOperationQueue alloc] init];
 
 GiftOperation *operation = [GiftOperation animateWithDuration: startBlock: endBlock:];
 
 [_opQueue addOperation:operation];
 
 */
