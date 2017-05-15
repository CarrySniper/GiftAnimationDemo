//
//  GiftTableView.h
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GiftViewCell.h"

typedef void (^OPIntegerBlock)(NSUInteger number);

@interface GiftTableView : UITableView

// 列表数据
@property (nonatomic, strong) NSMutableArray *dataArray;
// 礼物数量block
@property (nonatomic, copy) OPIntegerBlock countBlock;

/**
 为队列添加礼物展示

 @param model 礼物对象，可以修改成自己需要的类型
 */
- (void)addGiftModel:(GiftModel *)model;

@end
