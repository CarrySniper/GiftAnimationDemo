

#import "ShakeLabel.h"

@implementation ShakeLabel

- (void)countAccumulation:(NSTimeInterval)duration totalNumber:(NSUInteger)totalNumber
{
    __block NSInteger countTime = 0; // 计数器
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_gcdTimer,dispatch_walltime(NULL, 0), duration * NSEC_PER_SEC, 0); //秒执行
    dispatch_source_set_event_handler(_gcdTimer, ^{
        
        if(countTime >= totalNumber){ //计数结束，关闭
            dispatch_source_cancel(_gcdTimer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.transform = CGAffineTransformMakeScale(1.2, 1.2);
                } completion:^(BOOL finished) {
                    self.transform = CGAffineTransformIdentity; //还原
                }];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.text = [NSString stringWithFormat:@"x %ld", countTime];
            });
            countTime++;
        }
    });
    dispatch_resume(_gcdTimer);
}

//  重写 drawTextInRect 文字描边效果
- (void)drawTextInRect:(CGRect)rect {
    
    CGSize shadowOffset = self.shadowOffset;
    UIColor *textColor = self.textColor;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(c, 2);
    CGContextSetLineJoin(c, kCGLineJoinRound);
    
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    self.textColor = [UIColor yellowColor];
    [super drawTextInRect:rect];
    
    CGContextSetTextDrawingMode(c, kCGTextFill);
    self.textColor = textColor;
    self.shadowOffset = CGSizeMake(0, 0);
    [super drawTextInRect:rect];
    
    self.shadowOffset = shadowOffset;
}

@end
