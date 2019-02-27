//
//  UIImage+XXImage.h
//  GMSNew
//
//  Created by GMS_XiaoXin on 17/3/17.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XXImage)
// 颜色反转
- (UIImage *)xx_imageWithColor:(UIColor *)color;
// 获取沙盒中的图片
+ (UIImage *)xx_getDocumentImageWithPath:(NSString *)path;
// 获取沙盒中的图片  完整路径
+ (UIImage *)xx_getDocumentImageWithALLPath:(NSString *)path;
// 保存图片到本地沙盒路径
- (NSString *)xx_saveImageDocumentsFile:(NSString *)file name:(NSString *)name;
// 保存图片到本地沙盒路径返回完整路径
- (NSString *)xx_saveImageDocumentsAllFile:(NSString *)file name:(NSString *)name;
// 拍照后图片旋转
- (UIImage *)fixOrientation;

//加载保存在本地的gif图片
+ (UIImage *)xx_animatedGIFNamed:(NSString *)name;

//获取到图片的data后重新构造一张可以播放的图片
+ (UIImage *)xx_animatedGIFWithData:(NSData *)data;

//图片按照指定的尺寸缩放
- (UIImage *)xx_animatedImageByScalingAndCroppingToSize:(CGSize)size;
/**
 通过颜色创建图片

 @param color 色值

 @return 图片
 */
+ (UIImage *)xx_createImageWithColor:(UIColor*)color;
/**
 *  @brief  获得灰度图
 *
 *  @return 获得灰度图片
 */
- (UIImage*)xx_covertToGray;

/**
 *  @brief  取图片某一点的颜色
 *
 *  @param point 某一点
 *
 *  @return 颜色
 */
- (UIColor *)xx_colorAtPoint:(CGPoint )point;
//more accurate method ,colorAtPixel 1x1 pixel
/**
 *  @brief  取某一像素的颜色
 *
 *  @param point 一像素
 *
 *  @return 颜色
 */
- (UIColor *)xx_colorAtPixel:(CGPoint)point;
/**
 *  @brief  是否有alpha通道
 *
 *  @return 是否有alpha通道
 */
- (BOOL)xx_hasAlpha;
/**
 *  @brief  如果没有alpha通道 增加alpha通道
 *
 *  @return 如果没有alpha通道 增加alpha通道
 */
- (UIImage *)xx_imageWithAlpha;
/**
 *  @brief  增加透明边框
 *
 *  @param borderSize 边框尺寸
 *
 *  @return 增加透明边框后的图片
 */
- (UIImage *)xx_transparentBorderImage:(NSUInteger)borderSize;
///**
// *  @brief  修正图片的方向
// *
// *  @return 修正方向后的图片
// */
//- (UIImage *)xx_fixOrientation;
///**
// *  @brief  旋转图片
// *
// *  @param degrees 角度
// *
// *  @return 旋转后图片
// */
//- (UIImage *)xx_imageRotatedByDegrees:(CGFloat)degrees;
//
///**
// *  @brief  旋转图片
// *
// *  @param radians 弧度
// *
// *  @return 旋转后图片
// */
//- (UIImage *)xx_imageRotatedByRadians:(CGFloat)radians;
//
///**
// *  @brief  垂直翻转
// *
// *  @return  翻转后的图片
// */
//- (UIImage *)xx_flipVertical;
///**
// *  @brief  水平翻转
// *
// *  @return 翻转后的图片
// */
//- (UIImage *)xx_flipHorizontal;
//
///**
// *  @brief  角度转弧度
// *
// *  @param degrees 角度
// *
// *  @return 弧度
// */
//+(CGFloat)xx_degreesToRadians:(CGFloat)degrees;
///**
// *  @brief  弧度转角度
// *
// *  @param radians 弧度
// *
// *  @return 角度
// */
//+(CGFloat)xx_radiansToDegrees:(CGFloat)radians;
@end
