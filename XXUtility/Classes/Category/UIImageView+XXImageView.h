//
//  UIImageView+XXImage.h
//  zhong
//
//  Created by GMS_XiaoXin on 17/4/27.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XXImageView)

/**
 初始化imgView
 
 @param frame frame
 @param img   图片
 
 @return 实例化对象
 */
- (UIImageView *)xx_initWithFrame:(CGRect)frame img:(UIImage *)img;
/**
 *  @brief  倒影
 */
- (void)reflect;

@end
