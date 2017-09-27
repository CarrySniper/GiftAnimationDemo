//
//  GiftViewCell.m
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/12.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import "GiftViewCell.h"

@implementation GiftViewCell

#pragma mark 设置数据对象，如果是GiftModel则显示
- (void)setGiftObject:(NSObject *)object
{
    if (![object isKindOfClass:[GiftModel class]]) {
        self.contentView.hidden = YES;
        return;
    }
    self.contentView.hidden = NO;
    _giftModel = (GiftModel *)object;
    
    _userAvatar.backgroundColor = [UIColor whiteColor];
    
    if (_giftModel.UserName) {
        _username.text = _giftModel.UserName;
    }
    if (_giftModel.GiftName) {
        _giftName.text = _giftModel.GiftName;
    }
    self.countNumber.text = @"x 0";
    [self show];
}

#pragma mark 显示动画
- (void)show
{
    __weak typeof(self) weakSelf = self;
    _duration = [_giftModel totalTime] - 0.5;
    
    // 这句是有用的
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hide) object:nil];
    
    self.contentView.makeRight = 0;
    [self setNeedsLayout];
    
    [UIView animateWithDuration:showTime
                          delay:delayTime
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                            weakSelf.contentView.alpha = 1.0;
                            weakSelf.contentView.makeLeft = 0;
                        } completion:^(BOOL finished) {
                            [weakSelf.countNumber countAccumulation:animateTime totalNumber:_giftModel.Count];
                            [weakSelf performSelector:@selector(hide) withObject:nil afterDelay:_duration-hideTime];
                        }];
}

#pragma mark 隐藏动画
- (void)hide
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:hideTime animations:^{
        weakSelf.contentView.alpha = 0.0;
        weakSelf.contentView.makeLeft = 100;
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
