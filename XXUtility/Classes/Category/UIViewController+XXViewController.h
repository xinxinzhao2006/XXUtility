//
//  UIViewController+XXViewController.h
//  zhong
//
//  Created by GMS_XiaoXin on 17/4/30.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (XXViewController)
// push animated 默认YES
- (void)xx_pushVC:(UIViewController *)vc;
// push animated 可选
- (void)xx_pushVC:(UIViewController *)vc animated:(BOOL)animated;

// pop animated 默认YES
- (void)xx_pop;
// pop animated 可选
- (void)xx_popAnimated:(BOOL)animated;
// pop animated 默认YES
- (void)xx_popVC:(UIViewController *)vc;
// pop animated 可选
- (void)xx_popVC:(UIViewController *)vc animated:(BOOL)animated;

/**
 通过sb获取控制器

 @param identifier id

 @return 控制器
 */
- (UIViewController *)xx_getSbWithIdentifier:(NSString *)identifier;
/**
 通过sb获取控制器
 
 @param sbName sbName
 @param identifier id
 
 @return 控制器
 */
- (UIViewController *)xx_getSb:(NSString *)sbName identifier:(NSString *)identifier;

@end
