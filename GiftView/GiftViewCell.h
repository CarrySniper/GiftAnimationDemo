//
//  GiftViewCell.h
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/12.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CKFrame.h"
#import "GiftModel.h"

#import "CountLabel.h"

@interface GiftViewCell : UITableViewCell {
    NSTimeInterval _duration;
    GiftModel *_giftModel;
}

@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;   // 用户头像
@property (weak, nonatomic) IBOutlet UIImageView *giftPicture;  // 礼物图片
@property (weak, nonatomic) IBOutlet UILabel *username;         // 用户名称
@property (weak, nonatomic) IBOutlet UILabel *giftName;         // 礼物名称

@property (weak, nonatomic) IBOutlet CountLabel *countNumber;   // 礼物数量，这个可以自定义连击效果 ShakeLabel是参考他人的

/**
 设置数据对象，如果是GiftModel则显示

 @param object 数据
 */
- (void)setGiftObject:(NSObject *)object;

@end
