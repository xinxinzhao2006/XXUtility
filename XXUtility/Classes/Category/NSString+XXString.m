//
//  NSString+XXString.m
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/1/13.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import "NSString+XXString.h"

/*** MD5 ***/

#define CC_MD5_DIGEST_LENGTH    16          /* digest length in bytes */
#define CC_MD5_BLOCK_BYTES      64          /* block size in bytes */
#define CC_MD5_BLOCK_LONG       (CC_MD5_BLOCK_BYTES / sizeof(CC_LONG))

typedef uint32_t CC_LONG;       /* 32 bit unsigned integer */
typedef uint64_t CC_LONG64;     /* 64 bit unsigned integer */

typedef struct CC_MD5state_st
{
    CC_LONG A,B,C,D;
    CC_LONG Nl,Nh;
    CC_LONG data[CC_MD5_BLOCK_LONG];
    int num;
} CC_MD5_CTX;

extern int CC_MD5_Init(CC_MD5_CTX *c)
__OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

extern int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
__OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

extern int CC_MD5_Final(unsigned char *md, CC_MD5_CTX *c)
__OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)
__OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);


@implementation NSString (XXString)

- (NSString *)xx_insertString:(NSString *)str atIndex:(NSInteger)index
{
    NSMutableString *targerStr = [[NSMutableString alloc] initWithString:self ];
    
    [targerStr insertString:str atIndex:index];
    
    return [NSString stringWithString:targerStr];
}
/**
 判断是否包含str
 
 @param str 判断字符串
 @return 结果
 */
- (BOOL)xx_rangeOfString:(NSString *)str
{
    if ([self rangeOfString:str].location != NSNotFound)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
/**
 数组转字符串
 
 @param arr 字符串数组
 @return 字符串
 */
+ (NSString *)xx_getStrWithArr:(NSArray *)arr
{
    NSString *str = @"";
    
    NSMutableArray *mArr = [NSMutableArray arrayWithArray:arr];
    
    if (mArr.count > 0)
    {
        str = mArr[0];
        [mArr removeObjectAtIndex:0];
            
        for (int i = 0;i<mArr.count;i++)
        {
            str = [NSString stringWithFormat:@"%@,%@",str,mArr[0]];
        }
    }
    return str;
}
/**
 计算字符串size
 
 @param maxSize 最大size
 @param fontSize 字体大小
 @return 计算的size
 */
- (CGSize)calSizeWithMax:(CGSize)maxSize fontSize:(CGFloat)fontSize
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    labelSize.height = ceil(labelSize.height);
    labelSize.width = ceil(labelSize.width);
    return labelSize;
}
/**
 判断是否为空 为空替换
 
 @param str 替换的字符串
 @return 结果
 */
- (NSString *)xx_isEmptyReplac:(NSString *)str
{
    if ([self xx_isEmpty])
    {
        return str;
    }
    else
    {
        return self;
    }
}
/**
 去除字符串中的 空格和换行
 
 @return 去除后的字符串
 */
- (NSString *)xx_replacing
{
    NSString *str = [self stringByReplacingOccurrencesOfString: @" " withString: @""];
    str = [str stringByReplacingOccurrencesOfString: @"\n" withString: @""];
    
    return str;
}
/**
 去 -
 
 @return 去除后的字符串
 */
- (NSString *)xx_replac_
{
    NSString *str = [self stringByReplacingOccurrencesOfString: @"-" withString: @""];
    
    return str;
}
/**
 中文转拼音
 
 @return 拼音
 */
- (NSString*)xx_transformPinYin
{
    //方式一
    //先转换为带声调的拼音
    NSMutableString*str = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)str,NULL,kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL,kCFStringTransformStripDiacritics,NO);
    return str;
}
//获取字符串首字母(传入汉字字符串, 返回大写拼音首字母)
- (NSString *)xx_firstPingYinString
{
    NSString *strPinyin = @"";
    
    for (int i = 0; i<self.length; i++)
    {
        NSString *str = [self substringWithRange:NSMakeRange(i, 1)];
        
        //1.先传化为拼音
        NSString*pinYin = [[str xx_transformPinYin] uppercaseString];
        //2.获取首字母
        if (!pinYin||[pinYin xx_isEmpty]) {
            return @"#";
        }
        pinYin=[pinYin substringToIndex:1];
        if ([pinYin compare:@"A"]==NSOrderedAscending||[pinYin compare:@"Z"]==NSOrderedDescending) {
            pinYin = @"#";
        }
        strPinyin = [NSString stringWithFormat:@"%@%@",strPinyin,pinYin];
    }
    
    return strPinyin;
}
/**
 *  获取汉字拼音，包括判断返回#
 *
 *  @return 获取汉字拼音
 */
- (NSString *)xx_firstPingYin
{
    //1.先传化为拼音
    NSString*pinYin = [[self xx_transformPinYin] uppercaseString];
    //2.获取首字母
    if (!pinYin||[pinYin xx_isEmpty]) {
        return @"#";
    }
    pinYin=[pinYin substringToIndex:1];
    if ([pinYin compare:@"A"]==NSOrderedAscending||[pinYin compare:@"Z"]==NSOrderedDescending) {
        pinYin = @"#";
    }
    return pinYin;
}
/**
 判断是不是空值

 @return 结果
 */
- (BOOL)xx_isEmpty
{
    if ([self isKindOfClass:[NSNull class]] || self == nil || self == NULL || [self length] == 1 || [self isEqualToString:@"<null>"] || [self isEqualToString: @"(null)"])
    {
        return YES;
    }
    return NO;
}
#pragma mark - 加密解密
/**
 *  MD5加密
 */
-(NSString *)xx_md5Str
{
    const char *ptr = [self UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", md5Buffer[i]];
    }
    
    return [output copy];
}
/**
 *  字符串加密为base64
 *
 *  @return 返回String
 */
-(NSString *)xx_base64Str
{
    NSData *nsdata = [self
                      dataUsingEncoding:NSUTF8StringEncoding];
    
    // Get NSString from NSData object in Base64
    NSString *base64Encoded = [nsdata base64EncodedStringWithOptions:0];
    
    // Print the Base64 encoded string
    return  base64Encoded;
}
/**
 *  加密字符串解析
 *
 *  @return 返回解析后的字符串
 */
- (NSString *)xx_strFromBase64Str
{
    NSData *nsdataFromBase64String = [[NSData alloc]
                                      initWithBase64EncodedString:self options:0];
    
    // Decoded NSString from the NSData
    NSString *base64Decoded = [[NSString alloc]
                               initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
    return base64Decoded;
}
/**
 *  将字符串转化为NSURL
 *
 *  @return  NSURL地址
 */
-(NSURL *)xx_url
{
    return [NSURL URLWithString:self];
}
-(NSString *)xx_UTF8Str
{
    return [self stringByAddingPercentEscapesUsingEncoding:
            
            NSUTF8StringEncoding];;
}

/**
 将一个字符串改变中间文字的颜色
 
 @param changeString 需要改变的字符串
 @param range 范围
 @param color 改变成什么颜色
 @return 改变后的字符串
 */
-(NSMutableAttributedString *)xx_sendstring:(NSString *)changeString andRange:(NSRange)range andTextColor:(UIColor *)color
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:changeString];
    
    
    
    [noteStr addAttribute:NSForegroundColorAttributeName
     
                    value:color
     
                    range:range];
  
    
    return noteStr;
    
    
}




@end
