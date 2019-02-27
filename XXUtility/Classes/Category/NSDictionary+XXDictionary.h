//
//  NSDictionary+XXDictionary.h
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/1/11.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kMDic(dic) [dic xx_mDic]
#define kDicToJson(dic) [dic xx_toJson]
#define kDicFromJson(str) [NSDictionary xx_dicFromJson:str]
#define kDicMerge(dic1,dic2) [dic1 xx_mergingWith:dic2]
#define kDicFilter(dic) dic = [dic xx_dicFilter]

typedef void(^NSDictionaryBlock)(int index,id key,id obj);

@interface NSDictionary (XXDictionary)

/**
 转为可变字典
 
 @return 可变字典
 */
- (NSMutableDictionary *)xx_mDic;

/**
 遍历字典
 
 @param block 代码块
 */
- (void)xx_obj:(NSDictionaryBlock)block;

/**
 与某个字典合并
 
 @param dic 要合并的字典
 
 @return 合并后的字典
 */
- (NSDictionary *)xx_mergingWith:(NSDictionary *)dic;
/**
 *  @brief NSDictionary转换成JSON字符串
 *
 *  @return  JSON字符串
 */
-(NSString *)xx_toJson;
/**
 *  @brief  将NSDictionary转换成XML 字符串
 *
 *  @return XML 字符串
 */
- (NSString *)xx_toXML;
// 字典过滤空值
- (NSDictionary *)xx_dicFilter;
#pragma mark - 类方法
/**
 josn转字典
 
 @param json json
 
 @return 字典
 */
+ (NSDictionary *)xx_dicFromJson:(NSString *)json;
// data转字典
+ (NSDictionary *)xx_dicFormData:(NSData *)data;


@end
