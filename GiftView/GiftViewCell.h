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

static NSTimeInterval animateTime = 0.2;    // 数值动画时间间隔

static NSTimeInterval showTime = 0.28;      // 出现时间要充足，不然动画显示受Cell复用影响
static NSTimeInterval hideTime = 0.28;      // 隐藏时间

@interface GiftViewCell : UITableViewCell {
    NSTimeInterval _duration;
}
@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;
@property (weak, nonatomic) IBOutlet UIImageView *giftPicture;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *giftName;

- (void)setObject:(NSObject *)object;

@end
