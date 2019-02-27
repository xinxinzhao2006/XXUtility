//
//  UIImageView+XXImage.m
//  zhong
//
//  Created by GMS_XiaoXin on 17/4/27.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import "UIImageView+XXImageView.h"
#import "XXMacro.h"


#define kImgViewBgColor kColorFromHex(0xcdced3)

@implementation UIImageView (XXImageView)

- (instancetype)xx_initLineFrame:(CGRect)frame
{
    UIImageView *line = [[UIImageView alloc] initWithFrame:frame];
    // 配置背景颜色
    line.backgroundColor = kColor_White;
    return line;
}
- (instancetype)xx_initLineFrame:(CGRect)frame color:(UIColor *)color
{
    UIImageView *line = [[UIImageView alloc] initWithFrame:frame];
    // 配置背景颜色
    line.backgroundColor = color;
    return line;
}
- (UIImageView *)xx_initWithFrame:(CGRect)frame img:(UIImage *)img
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    if (img)
    {
        imgView.image = img;
    }
    
    return imgView;
}

/**
 *  @brief  倒影
 */
- (void)reflect {
    CGRect frame = self.frame;
    frame.origin.y += (frame.size.height + 1);
    
    UIImageView *reflectionImageView = [[UIImageView alloc] initWithFrame:frame];
    self.clipsToBounds = TRUE;
    reflectionImageView.contentMode = self.contentMode;
    [reflectionImageView setImage:self.image];
    reflectionImageView.transform = CGAffineTransformMakeScale(1.0, -1.0);
    
    CALayer *reflectionLayer = [reflectionImageView layer];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = reflectionLayer.bounds;
    gradientLayer.position = CGPointMake(reflectionLayer.bounds.size.width / 2, reflectionLayer.bounds.size.height * 0.5);
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[[UIColor clearColor] CGColor],
                            (id)[[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3] CGColor], nil];
    
    gradientLayer.startPoint = CGPointMake(0.5,0.5);
    gradientLayer.endPoint = CGPointMake(0.5,1.0);
    reflectionLayer.mask = gradientLayer;
    
    [self.superview addSubview:reflectionImageView];
    
}

@end
