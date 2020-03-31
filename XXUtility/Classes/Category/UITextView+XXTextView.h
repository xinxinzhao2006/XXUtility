//
//  UITextView+XXTextView.h
//  XXDataManager
//
//  Created by 小新 on 2018/8/29.
//  Copyright © 2018年 小新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (XXTextView)


/**
 默认字符串

 @param placeholdStr 提示文本
 @param placeholdColor 颜色
 */
-(void)xx_setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor;

@end
