//
//  UITabBar+XXTabBar.h
//  YJBestBusiness
//
//  Created by Aranion on 2017/9/6.
//  Copyright © 2017年 YJBest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (XXTabBar)

- (void)xx_showBadgeOnItemIndex:(int)index value:(NSString *)value;

- (void)xx_showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)xx_hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
