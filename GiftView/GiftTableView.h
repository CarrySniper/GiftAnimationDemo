//
//  GiftTableView.h
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftTableView : UITableView

/**
 为队列添加礼物展示

 @param object 礼物对象，可以修改成自己需要的类型
 */
- (void)addGiftObject:(NSObject *)object;

@end
