//
//  UILabel+XXLabel.h
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/2/20.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XXLabel)

// 0 左   1 中  2右
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

@end
