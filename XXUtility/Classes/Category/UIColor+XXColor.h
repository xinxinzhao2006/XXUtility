//
//  UIColor+XXColor.h
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/3/22.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XXColor)

// 随机色
+ (UIColor *)xx_randomColor;

+ (UIColor *)xx_colorWithHex:(UInt32)hex;
+ (UIColor *)xx_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)xx_colorWithHexString:(NSString *)hexString;
- (NSString *)xx_HEXString;

@end
