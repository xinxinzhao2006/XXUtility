//
//  NSDictionary+XXDictionary.m
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/1/11.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import "NSDictionary+XXDictionary.h"
#import "XXMacro.h"

@implementation NSDictionary (XXDictionary)

- (NSDictionary *)xx_dicFilter
{
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyStr in self.allKeys) {
        
        id valve = [self objectForKey:keyStr];
        
        if ([valve isEqual:[NSNull null]]) {
            
            [mutableDic setObject:@"" forKey:keyStr];
        }
        else if([valve isKindOfClass:[NSString class]])
        {
            if (kIsEmptyStr(kString(valve)))
            {
                [mutableDic setObject:@"" forKey:keyStr];
            }
        }
        else
        {
            [mutableDic setObject:[self objectForKey:keyStr] forKey:keyStr];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:mutableDic];
}

/**
 转为可变字典
 
 @return 可变字典
 */
- (NSMutableDictionary *)xx_mDic
{
    return [NSMutableDictionary dictionaryWithDictionary:self];
    
}
// 遍历字典
- (void)xx_obj:(NSDictionaryBlock)block
{
    NSArray *arr = self.allKeys;
    
    for (int i = 0; i<self.allKeys.count; i++)
    {
        NSString *key = arr[i];
        block(i,key,self[key]);
    }
}
/**
 *  @brief NSDictionary转换成JSON字符串
 *
 *  @return  JSON字符串
 */
-(NSString *)xx_toJson{
    NSError *error = nil;
    //NSJSONWritingPrettyPrinted:指定生成的JSON数据应使用空格旨在使输出更加可读。如果这个选项是没有设置,最紧凑的可能生成JSON表示。
    NSData *jsonData = [NSJSONSerialization
                        dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if ([jsonData length] > 0 && error == nil)
    {
        //NSData转换为String
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    else if ([jsonData length] == 0 &&
             error == nil)
    {
        NSLog(@"No data was returned after serialization.");
    }
    else if (error != nil)
    {
        NSLog(@"An error happened = %@", error);
    }
    return @"111";
    
    
}
/**
 *  @brief  将NSDictionary转换成XML 字符串
 *
 *  @return XML 字符串
 */
- (NSString *)xx_toXML {
    
    NSString *xmlStr = @"<xml>";
    
    for (NSString *key in self.allKeys) {
        
        NSString *value = [self objectForKey:key];
        
        xmlStr = [xmlStr stringByAppendingString:[NSString stringWithFormat:@"<%@>%@</%@>", key, value, key]];
    }
    
    xmlStr = [xmlStr stringByAppendingString:@"</xml>"];
    
    return xmlStr;
}

/**
 josn转字典
 
 @param json json
 
 @return 字典
 */
+ (NSDictionary *)xx_dicFromJson:(NSString *)json
{
    if (!json)
    {
        return nil;
    }
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
/**
 与某个字典合并
 
 @param dic 要合并的字典
 
 @return 合并后的字典
 */
- (NSDictionary *)xx_mergingWith:(NSDictionary *)dic
{
    if (!dic)
    {
        return nil;
    }
    
    NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary:self];
    
    [dic xx_obj:^(int index,id key, id obj) {
        
        [mdic setObject:obj forKey:key];
        
    }];
    
    return [NSDictionary dictionaryWithDictionary:mdic];
}

#pragma mark - 类方法
/*
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)xx_dicFormJson:(NSString *)jsonString
{
    
    if ([[jsonString class] isSubclassOfClass:[NSString class]])
    {
        if (jsonString == nil) {
            return nil;
        }
        
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        if(err) {
            NSLog(@"json解析失败：%@",err);
            return nil;
        }
        return dic;
    }
    else
    {
        return nil;
    }
}
// data转字典
+ (NSDictionary *)xx_dicFormData:(NSData *)data
{
    
    if (data == nil) {
        return nil;
    }
    
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
