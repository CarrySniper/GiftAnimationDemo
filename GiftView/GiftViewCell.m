//
//  GiftViewCell.m
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import "GiftViewCell.h"
#import "UIView+CKFrame.h"

@implementation GiftViewCell

static NSTimeInterval showTime = 0.28;
static NSTimeInterval hideTime = 0.28;
- (void)animateWithDuration:(NSTimeInterval)duration giftObject:(NSObject *)object
{
    if ([object isKindOfClass:[NSNull class]]) {
        return;
    }
    _duration = duration;
    
    self.textLabel.text = [NSString stringWithFormat:@"礼物：%@秒", object];
    [self show];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)show
{
    // 这句是有用的
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hide) object:nil];
    
    self.contentView.makeRight = 0;
    [self setNeedsLayout];
    
    [UIView animateWithDuration:showTime
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentView.alpha = 1.0;
        self.contentView.makeLeft = 0;
    } completion:^(BOOL finished) {
        [self performSelector:@selector(hide) withObject:nil afterDelay:_duration-showTime-hideTime];
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
