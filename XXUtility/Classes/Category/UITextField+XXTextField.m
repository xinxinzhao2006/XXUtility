//
//  UITextField+XXTextField.m
//  Unity-iPhone
//
//  Created by yf-zhaonx on 2018/11/8.
//

#import "UITextField+XXTextField.h"
#import "XXMacro.h"

@implementation UITextField (XXTextField)

// 限制键盘只能输入数字  且两位小数
- (BOOL)xx_limitNumber:(NSRange)range str:(NSString *)string
{
    BOOL isHaveDian = YES;
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    
    if ([self.text rangeOfString:@"."].location == NSNotFound) {
        isHaveDian = NO;
    }
    if ([string length] > 0) {
        
        unichar single = [string characterAtIndex:0];//当前输入的字符
        if ((single >= '0' && single <= '9') || single == '.') {//数据格式正确
            
            if([self.text length] == 0){
                if(single == '.') {
                    [self.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            
            //输入的字符是否是小数点
            if (single == '.') {
                if(!isHaveDian)//text中还没有小数点
                {
                    isHaveDian = YES;
                    return YES;
                    
                }else{
                  
                    [self.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }else{
                if (isHaveDian) {//存在小数点
                    
                    //判断小数点的位数
                    NSRange ran = [self.text rangeOfString:@"."];
                    if (range.location - ran.location <= 2) {
                        return YES;
                    }else{
                        return NO;
                    }
                }else{
                    return YES;
                }
            }
        }else{//输入的数据格式不正确
            [self.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    else
    {
        return YES;
    }
}
// 过滤特殊符号 表情
- (BOOL)xx_filtr:(NSString *)string
{
    if ([self isFirstResponder]) {
        
        if (kStrEqual(string, @"?")||kStrEqual(string, @"|")||kStrEqual(string, @"/")||kStrEqual(string, @":")||kStrEqual(string, @"*")||kStrEqual(string, @"\\")||kStrEqual(string, @"\"")) {
            return NO;
        }
        
        if ([self isFirstResponder]) {
            
            if ([[[self textInputMode] primaryLanguage] isEqualToString:@"emoji"] || ![[self textInputMode] primaryLanguage]) {
                return NO;
            }
            
            //判断键盘是不是九宫格键盘
            if ([self isNineKeyBoard:string] ){
                return YES;
            }else{
//                if ([self hasEmoji:string] || [XXTollClass stringContainsEmoji:string]){
//                    return NO;
//                }
            }
        }
    }
    return YES;
}

/**
 判断是不是九宫格
 @param string  输入的字符
 @return YES(是九宫格拼音键盘)
 */
-(BOOL)isNineKeyBoard:(NSString *)string
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    int len = (int)string.length;
    for(int i=0;i<len;i++)
    {
        if(!([other rangeOfString:string].location != NSNotFound))
            return NO;
    }
    return YES;
}

//利用下面这个方法hasEmoji可以限制第三方键盘（常用的是搜狗键盘）的表情
/**
 *  判断字符串中是否存在emoji
 * @param string 字符串
 * @return YES(含有表情)
 */
- (BOOL)hasEmoji:(NSString*)string;
{
    NSString *pattern = @"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:string];
    return isMatch;
}

@end
