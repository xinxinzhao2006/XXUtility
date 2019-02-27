//
//  UIButton+XXButton.h
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/2/20.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchedBlock)(NSInteger tag);

@interface UIButton (XXButton)

@property (copy, nonatomic) NSString *xx_title;
@property (strong, nonatomic) UIColor *xx_titleColor;
@property (assign, nonatomic) CGFloat xx_font;
@property (strong, nonatomic) UIImage *xx_img;
// 1左 2中 3右
@property (assign, nonatomic) NSInteger xx_alignment;
// 设置按钮额外热区
@property (nonatomic, assign) UIEdgeInsets xx_touchAreaInsets;


/**
 实例化按钮对象

 @param frame        frame
 @param cornerRadius  圆角
 @param title        标题

 @return 实例化对象
 */
- (instancetype )xx_initWithFrame:(CGRect)frame andTitle:(NSString *)title cornerRadius:(CGFloat)cornerRadius Block:(TouchedBlock)block;
/**
 实例化按钮对象
 
 @param frame        frame
 @param cornerRadius  圆角
 @param img          图片
 @param bgimg        背景图
 
 @return 实例化对象
 */
- (UIButton *)xx_initWithFrame:(CGRect)frame img:(NSString *)img bgImg:(NSString *)bgimg cornerRadius:(CGFloat)cornerRadius Block:(TouchedBlock)block;


// 显示菊花
- (void) xx_showIndicator;
// 隐藏菊花
- (void) xx_hideIndicator;

/**
 设置按钮倒计时

 @param timeout    时间
 @param tittle     倒计时结束后的标题
 @param waitTittle 标题后面部分
 */
-(void)xx_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;
/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param color 背景颜色
 *  @param state 按钮状态
 */
- (void)xx_setBgColor:(UIColor *)color forState:(UIControlState)state;
// 上下居中，图片在上，文字在下
- (void)xx_v_imgAndTitle:(CGFloat)spacing;
- (void)xx_v_imgAndTitle; //默认6.0

// 左右居中，文字在左，图片在右
- (void)xx_h_titleAndImg:(CGFloat)spacing;
- (void)xx_h_titleAndImg; //默认6.0

// 左右居中，图片在左，文字在右
- (void)xx_h_imgAndTitle:(CGFloat)spacing;
- (void)xx_h_imgAndTitle; //默认6.0

// 文字居中，图片在左边
- (void)xx_h_titleAndImgLeft:(CGFloat)spacing;
- (void)xx_h_titleAndImgLeft; //默认6.0

// 文字居中，图片在右边
- (void)xx_h_titleAndImgRight:(CGFloat)spacing;
- (void)xx_h_titleAndImgRight; //默认6.0

@end
