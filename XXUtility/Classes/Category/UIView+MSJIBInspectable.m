//
//  UIView+MSJIBInspectable.m
//  Stone
//
//  Created by 陈嘉鸿 on 17/5/10.
//  Copyright © 2017年 Jerry. All rights reserved.
//

#import "UIView+MSJIBInspectable.h"

@implementation UIView (MSJIBInspectable)

#pragma mark - setCornerRadius/borderWidth/borderColor
- (void)setCornerRadius:(NSInteger)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (NSInteger)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(NSInteger)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (NSInteger)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}


@end
