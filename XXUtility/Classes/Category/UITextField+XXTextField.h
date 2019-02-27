//
//  UITextField+XXTextField.h
//  Unity-iPhone
//
//  Created by yf-zhaonx on 2018/11/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (XXTextField)
/*
 
 // 使用方法 ：监听代理，调用方法
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 {
    // 限制特殊字符
    return [textField xx_filtr:string];
    // 限制只能输入数字 保留两位小数
    return [textField xx_limitNumber:range str:string];
 
    return YES;
 }
 */
// 限制键盘只能输入数字  且两位小数
- (BOOL)xx_limitNumber:(NSRange)range str:(NSString *)string;
// 过滤掉特殊符号  及表情符号
- (BOOL)xx_filtr:(NSString *)string;


@end

NS_ASSUME_NONNULL_END
