//
//  NSDate+XXDate.m
//  XXModule
//
//  Created by yf-zhaonx on 2020/3/26.
//  Copyright © 2020 小新. All rights reserved.
//

#import "NSDate+XXDate.h"

@implementation NSDate (XXDate)

// 获取当前时间字符串  dateFormatt 格式
+ (NSString *)xx_strWithCurrentDate:(XXDateFormatt)dateFormatt
{
    NSDate *date = [self worldTimeToChinaTime:[NSDate date]];
    
    return  [self xx_strWithDate:date timeFormatt:dateFormatt];
}
// 时间转字符串 dateFormatt 格式
+ (NSString *)xx_strWithDate:(NSDate *)date timeFormatt:(XXDateFormatt)dateFormatt
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    
    if (dateFormatt == XXDateFormatt_YYYYMMDDHHMMSS)
    {
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    }
    
    if (dateFormatt == XXDateFormatt_YYYYMMDD)
    {
        [formatter setDateFormat:@"YYYY-MM-dd"];
    }
    
    if (dateFormatt == XXDateFormatt_YYYYMMDDHHMM)
    {
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    }
    
    if (dateFormatt == XXDateFormatt_HHMMSS)
    {
        [formatter setDateFormat:@"HH:mm:ss"];
    }
    
    NSString *currentTimeString = [formatter stringFromDate:date];
    
    return currentTimeString;
}
// 时间戳转字符串 dateFormatt 格式
+ (NSString *)xx_strWithTimeInterval:(double)timeInterval timeFormatt:(XXDateFormatt)dateFormatt
{
    NSDate *date = [self xx_dateWithTimeInterval:timeInterval];
    
    return [self xx_strWithDate:date timeFormatt:dateFormatt];
}
// 字符串时间转格式 dateFormatt 格式
+ (NSString *)xx_strWithStr:(NSString *)strDate fromeFormatt:(XXDateFormatt)fromeDateFormatt toFormatt:(XXDateFormatt)toDateFormatt
{
    NSDate *date = [self xx_dateWithStr:strDate formatt:fromeDateFormatt];
    NSString *strNewDate = [self xx_strWithDate:date timeFormatt:toDateFormatt];
    
    return strNewDate;
}
// 转时间戳
+ (double)xx_timeIntervalWithDate:(NSDate *)date
{
    return [date timeIntervalSince1970];
}

// 字符串转时间戳  dateFormatt 格式
+ (double )xx_timeIntervalWithStr:(NSString *)strDate formatt:(XXDateFormatt)dateFormatt
{
    NSDate *date = [self xx_dateWithStr:strDate formatt:dateFormatt];
    
    return [self xx_timeIntervalWithDate:date];
}

// 时间戳 转 时间
+ (NSDate *)xx_dateWithTimeInterval:(double)timeInterval
{
    NSTimeInterval time = timeInterval ;//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    return detaildate;
}
// 字符串转时间 dateFormatt 格式
+ (NSDate *)xx_dateWithStr:(NSString *)strDate formatt:(XXDateFormatt)dateFormatt
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    if (dateFormatt == XXDateFormatt_YYYYMMDDHHMMSS)
    {
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    }
    
    if (dateFormatt == XXDateFormatt_YYYYMMDD)
    {
        [formatter setDateFormat:@"YYYY-MM-dd"];
    }
    
    if (dateFormatt == XXDateFormatt_YYYYMMDDHHMM)
    {
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    }
    
    if (dateFormatt == XXDateFormatt_HHMMSS)
    {
        [formatter setDateFormat:@"HH:mm:ss"];
    }
    
    NSDate *date = [formatter dateFromString:strDate];
    
    return [self worldTimeToChinaTime:date];
}
// 将世界时间转化为中国区时间
+ (NSDate *)worldTimeToChinaTime:(NSDate *)date
{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval:interval];
    return localeDate;
}

@end
