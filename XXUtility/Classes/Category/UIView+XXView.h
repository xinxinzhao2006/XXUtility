//
//  UIView+XXView.h
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/2/15.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

typedef NS_OPTIONS(NSUInteger, ExcludePoint) {
    ExcludeStartPoint = 1 << 0,
    ExcludeEndPoint = 1 << 1,
    ExcludeAllPoint = ~0UL
};

@interface UIView (XXView)

#pragma mark - 属性
@property (assign, nonatomic) CGFloat xx_x;
@property (assign, nonatomic) CGFloat xx_y;
@property (assign, nonatomic) CGFloat xx_width;
@property (assign, nonatomic) CGFloat xx_height;
@property (assign, nonatomic) CGFloat xx_max_x;
@property (assign, nonatomic) CGFloat xx_max_y;
@property (assign, nonatomic) CGFloat xx_cornerRadius;
@property (strong, nonatomic) UIColor *xx_borderColor;
@property (assign, nonatomic) CGFloat xx_borderWidth;
@property (nonatomic, assign) CGPoint xx_origin;
@property (nonatomic, assign) CGSize xx_size;
@property (nonatomic) CGFloat xx_centerX;
@property (nonatomic) CGFloat xx_centerY;
@property (assign, nonatomic) BOOL xx_masksToBounds;

// 画线默认颜色
- (instancetype)xx_initLineFrame:(CGRect)frame;
// 画线 自定义颜色
- (instancetype)xx_initLineFrame:(CGRect)frame color:(UIColor *)color;
/**
 *  @brief  找到当前view所在的viewcontroler
 */
@property (readonly) UIViewController *xx_vc;
/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)screenshot;
/**
 max_x + 间隙
 
 @param space 间隙
 
 @return 值
 */
- (CGFloat)xx_max_x_offset:(CGFloat)space;
/**
 max_y + 间隙
 
 @param space 间隙
 
 @return 值
 */
- (CGFloat)xx_max_y_offset:(CGFloat)space;
/**
 x + 间隙
 
 @param space 间隙
 
 @return 值
 */
- (CGFloat)xx_x_offset:(CGFloat)space;
/**
 y + 间隙
 
 @param space 间隙
 
 @return 值
 */
- (CGFloat)xx_y_offset:(CGFloat)space;
/**
 设置边框 宽 颜色
 
 @param w     宽度
 @param color 颜色
 */
- (void)xx_setBorder:(CGFloat )w andColor:(UIColor*)color;
/**
 设置背景图片
 
 @param img 图片
 */
- (void)xx_setBgImg:(UIImage *)img;


/**
 设置一个view的某一个边框线
 
 @param view 当前view
 @param top 上
 @param left 左
 @param bottom 下
 @param right 右
 @param color 颜色
 @param width 宽度
 */
- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;

#pragma mark - 手势
/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)xx_addTapActionWithBlock:(GestureActionBlock)block;
/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)xx_addLongPressActionWithBlock:(GestureActionBlock)block;

#pragma mark - 边框
- (void)xx_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)xx_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth;
- (void)xx_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)xx_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;

- (void)xx_removeTopBorder;
- (void)xx_removeLeftBorder;
- (void)xx_removeBottomBorder;
- (void)xx_removeRightBorder;

#pragma mark - 单边圆角
- (void)xx_cornerRadius:(CGFloat)radius RectCorner:(UIRectCorner)Corner;
@end
