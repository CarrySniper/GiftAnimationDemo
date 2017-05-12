//
//  GiftViewCell.m
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/12.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import "GiftViewCell.h"

@implementation GiftViewCell

- (void)setObject:(NSObject *)object
{
    if (![object isKindOfClass:[GiftModel class]]) {
        self.contentView.hidden = YES;
        return;
    }
    self.contentView.hidden = NO;
    // 规则：数字增长间隔 animateTime 秒
    // 基础时间1秒
    GiftModel *model = (GiftModel *)object;
    _duration = 1.0 + model.Count * animateTime;
    
    _userAvatar.backgroundColor = [UIColor whiteColor];
    
    if (model.UserName) {
        _username.text = model.UserName;
    }
    if (model.GiftName) {
        _giftName.text = model.GiftName;
    }
    
    [self show];
}

- (void)show
{
    // 这句是有用的
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hide) object:nil];
    
    self.contentView.makeRight = 0;
    [self setNeedsLayout];
    
    [UIView animateWithDuration:showTime
                          delay:showTime
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.contentView.alpha = 1.0;
                            self.contentView.makeLeft = 0;
                        } completion:^(BOOL finished) {
                            [self performSelector:@selector(hide) withObject:nil afterDelay:_duration-showTime*2-hideTime];
                        }];
}

- (void)hide
{
    [UIView animateWithDuration:hideTime animations:^{
        self.contentView.alpha = 0.0;
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
