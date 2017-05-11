//
//  GiftViewCell.h
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftViewCell : UITableViewCell {
    NSTimeInterval _duration;
    
    UIImageView *_userAvatar;
    UIImageView *_giftPicture;
    UILabel *_username;
    UILabel *_giftName;
}

- (void)animateWithDuration:(NSTimeInterval)duration giftObject:(NSObject *)object;

@end
