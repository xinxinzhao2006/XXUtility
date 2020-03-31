//
//  NSString+XXString.h
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/1/13.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kJsonDic(str) [dic xx_toJson]


@interface NSString (XXString)

/**
 指定位置插入字符

 @param str 插入的字符
 @param index 位置
 @return 完成后的字符
 */
- (NSString *)xx_insertString:(NSString *)str atIndex:(NSInteger)index;

/**
 判断是否包含str

 @param str 判断字符串
 @return 结果
 */
- (BOOL)xx_rangeOfString:(NSString *)str;
/**
 判断是不是空值
 
 @return 结果
 */
- (BOOL)xx_isEmpty;

/**
 计算字符串size

 @param maxSize 最大size
 @param fontSize 字体大小
 @return 计算的size
 */
- (CGSize)xx_calSizeWithMax:(CGSize)maxSize fontSize:(CGFloat)fontSize;

/**
 判断是否为空 为空替换

 @param str 替换的字符串
 @return 结果
 */
- (NSString *)xx_isEmptyReplac:(NSString *)str;
/**
 中文转拼音
 
 @return 拼音
 */
- (NSString*)xx_transformPinYin;
/**
 获取字符串首字母(传入汉字字符串, 返回大写拼音首字母)
 
 @return 拼音
 */
- (NSString *)xx_firstPingYinString;
/**
 *  获取汉字拼音，包括判断返回#
 *
 *  @return 获取汉字拼音
 */
- (NSString *)xx_firstPingYin;

/**
 数组转字符串

 @param arr 字符串数组
 @return 字符串
 */
+ (NSString *)xx_getStrWithArr:(NSArray *)arr;
#pragma mark - 加密解密
/**
 *  MD5加密
 */
-(NSString *)xx_md5Str;
/**
 *  字符串加密为base64
 *
 *  @return 返回String
 */
-(NSString *)xx_base64Str;
/**
 *  加密字符串解析
 *
 *  @return 返回解析后的字符串
 */
- (NSString *)xx_strFromBase64Str;
/**
 *  将字符串转化为NSURL
 *
 *  @return  NSURL地址
 */
-(NSURL *)xx_url;
/**
 去除字符串中的 空格和换行

 @return 去除后的字符串
 */
- (NSString *)xx_replacing;
/**
 去除字符串中的 某个字符
 
 @return 去除后的字符串
 */
- (NSString *)xx_replacingStr:(NSString *)str;
/**
 查询某个字符串在自身的位置

 @param str 要查询的字符串
 @return range
 */
- (NSRange )xx_rangeStr:(NSString *)str;
/**
 以某个字符串做分割

 @param str 标识字符
 @return 分割后的数组
 */
- (NSArray *)xx_separatedByStr:(NSString *)str;

@end
