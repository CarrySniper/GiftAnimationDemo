//
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import "UIView+CKFrame.h"

@implementation UIView (CKFrame)

// MARK: - Left
- (void)setMakeLeft:(CGFloat)makeLeft
{
    CGRect frame = self.frame;
    frame.origin.x = makeLeft;
    self.frame = frame;
}
- (CGFloat)makeLeft
{
    return CGRectGetMinX(self.frame);
}

// MARK: - Right
- (void)setMakeRight:(CGFloat)makeRight
{
    CGRect frame = self.frame;
    frame.origin.x = makeRight - self.makeWidth;
    self.frame = frame;
}
- (CGFloat)makeRight
{
    return CGRectGetMaxX(self.frame);
}

// MARK: - Top
- (void)setMakeTop:(CGFloat)makeTop
{
    CGRect frame = self.frame;
    frame.origin.y = makeTop;
    self.frame = frame;
}
- (CGFloat)makeTop
{
    return CGRectGetMinY(self.frame);
}
// MARK: - Top
- (void)setMakeBottom:(CGFloat)makeBottom
{
    CGRect frame = self.frame;
    frame.origin.y = makeBottom - self.makeHeight;
    self.frame = frame;
}
- (CGFloat)makeBottom
{
    return CGRectGetMaxY(self.frame);
}
// MARK: - width
- (void)setMakeWidth:(CGFloat)makeWidth
{
    CGRect frame = self.frame;
    frame.size.width = makeWidth;
    self.frame = frame;
}
- (CGFloat)makeWidth
{
    return CGRectGetWidth(self.frame);
}

// MARK: - height
- (void)setMakeHeight:(CGFloat)makeHeight
{
    CGRect frame = self.frame;
    frame.size.height = makeHeight;
    self.frame = frame;
}
- (CGFloat)makeHeight
{
    return CGRectGetHeight(self.frame);
}

// MARK: - centerX
- (void)setMakeCenterX:(CGFloat)makeCenterX
{
    CGPoint point = self.center;
    point.x = makeCenterX;
    self.center = point;
}
- (CGFloat)makeCenterX
{
    return self.center.x;
}

// MARK: - centerY
- (void)setMakeCenterY:(CGFloat)makeCenterY
{
    CGPoint point = self.center;
    point.y = makeCenterY;
    self.center = point;
}
- (CGFloat)makeCenterY
{
    return self.center.y;
}

@end
