//
//  GiftModel.h
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/12.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

/* 礼物模型  可以根据根据后台字段修改 */
#import <Foundation/Foundation.h>

@interface GiftModel : NSObject

@property (nonatomic, copy) NSNumber *Id;           // 礼物ID

@property (nonatomic, copy) NSString *Avatar;       // 用户头像
@property (nonatomic, copy) NSString *UserName;     // 用户名称

@property (nonatomic, copy) NSString *GiftUrl;      // 礼物图片
@property (nonatomic, copy) NSString *GiftName;     // 礼物名称

@property (nonatomic, assign) NSUInteger Count;     // 礼物数量

@end
