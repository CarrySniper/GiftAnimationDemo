//
//  GiftModel.m
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/12.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import "GiftModel.h"

@implementation GiftModel


- (NSTimeInterval)totalTime
{
    // 时间计算和礼物动画时间有关，cell要先消失再显示下一个礼物
    // 基础时间1秒+scrollToRow给个0.5秒=1.5；在cell里面要去掉这0.5
    // 数字增长间隔 animateTime 秒
    // 礼物显示+隐藏时间showTime+hideTime
    if (self.Count > 0) {
        return 1.5 + self.Count * animateTime + delayTime + showTime + hideTime;
    }else{
        return 1.5;
    }
}


@end
