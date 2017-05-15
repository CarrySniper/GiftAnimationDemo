//
//  GiftModel.h
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/12.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

/* 礼物模型  可以根据根据后台字段修改 */
#import <Foundation/Foundation.h>

// MARK 静态常量
static const NSTimeInterval animateTime = 0.05;   // 数值动画时间间隔
static const NSTimeInterval showTime = 0.28;      // 出现时间
static const NSTimeInterval delayTime = 0.28;     // 延时时间要充足，不然受Cell复用影响动画效果
static const NSTimeInterval hideTime = 0.28;      // 隐藏时间

// MARK 礼物模型
@interface GiftModel : NSObject

@property (nonatomic, copy) NSNumber *Id;           // 礼物ID

@property (nonatomic, copy) NSString *Avatar;       // 用户头像
@property (nonatomic, copy) NSString *UserName;     // 用户名称

@property (nonatomic, copy) NSString *GiftUrl;      // 礼物图片
@property (nonatomic, copy) NSString *GiftName;     // 礼物名称

@property (nonatomic, assign) NSUInteger Count;     // 礼物数量

/**
 获取总动画时间
 
 @return 时间
 */
- (NSTimeInterval)totalTime;

@end
