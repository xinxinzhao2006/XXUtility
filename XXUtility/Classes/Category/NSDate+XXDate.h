//
//  NSDate+XXDate.h
//  XXModule
//
//  Created by yf-zhaonx on 2020/3/26.
//  Copyright © 2020 小新. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum XXDateFormatt {
    
    //枚举名 _ 类型
    XXDateFormatt_YYYYMMDD  = 0,
    XXDateFormatt_YYYYMMDDHHMMSS,
    XXDateFormatt_YYYYMMDDHHMM,
    XXDateFormatt_HHMMSS,
    
} XXDateFormatt;

@interface NSDate (XXDate)

// 获取当前时间字符串  dateFormatt 格式
+ (NSString *)xx_strWithCurrentDate:(XXDateFormatt)dateFormatt;

// 时间转字符串 dateFormatt 格式
+ (NSString *)xx_strWithDate:(NSDate *)date timeFormatt:(XXDateFormatt)dateFormatt;

// 时间戳转字符串 dateFormatt 格式
+ (NSString *)xx_strWithTimeInterval:(double)timeInterval timeFormatt:(XXDateFormatt)dateFormatt;

// 字符串时间转格式 dateFormatt 格式
+ (NSString *)xx_strWithStr:(NSString *)strDate fromeFormatt:(XXDateFormatt)fromeDateFormatt toFormatt:(XXDateFormatt)toDateFormatt;

// 转时间戳
+ (double)xx_timeIntervalWithDate:(NSDate *)date;

// 字符串转时间戳  dateFormatt 格式
+ (double )xx_timeIntervalWithStr:(NSString *)strDate formatt:(XXDateFormatt)dateFormatt;

// 时间戳 转 时间
+ (NSDate *)xx_dateWithTimeInterval:(double)timeInterval;

// 字符串转时间 dateFormatt 格式
+ (NSDate *)xx_dateWithStr:(NSString *)strDate formatt:(XXDateFormatt)dateFormatt;



@end

NS_ASSUME_NONNULL_END
