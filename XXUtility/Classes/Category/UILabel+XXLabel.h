//
//  UILabel+XXLabel.h
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/2/20.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XXLabel)

// 1 左   2 中  3右
@property (assign, nonatomic) NSInteger xx_alignment;

/**
 *  创建Label
 *
 *  @param frame frame
 *  @param title 标题
 *  @param font  字体大小
 *
 *  @return Label
 */
- (instancetype)xx_initWithFrame:(CGRect)frame title:(NSString *)title fontSize:(CGFloat )font color:(UIColor *)color;


/**
 给UILabel设置行间距和字间距

 @param str 字符串
 @param font 字体大小
 @param range 范围
 @param color 改变成什么颜色
 @param Spacing 行间距
 */
-(void)xxsetLabelSpacelabelwithValue:(NSString*)str withFont:(UIFont*)font andlineSpacing:(CGFloat)Spacing andRange:(NSRange)range andTextColor:(UIColor *)color;


/**
 计算UILabel的高度(带有行间距的情况)

 @param str 字符串
 @param font 大小
 @param width 宽度
 @param Spacing 行间距
 @return 高度
 */
-(CGFloat)xxgetSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width andlineSpacing:(CGFloat)Spacing;

/** 设置某段文字的字体、颜色
 *
 *  string                            原文字
 *  rangeStr                          需要设置的文字
 *  NSForegroundColorAttributeName    设置颜色
 *  NSFontAttributeName               设置字体
 */
- (void)attributeWithString:(NSString *)string rangeString:(NSString *)rangeStr font:(UIFont *)font color:(UIColor *)color;

@end
