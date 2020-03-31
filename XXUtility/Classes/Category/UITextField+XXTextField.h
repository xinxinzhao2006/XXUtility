//
//  UITextField+XXTextField.h
//  XXModule
//
//  Created by yf-zhaonx on 2020/3/26.
//  Copyright © 2020 小新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum XXTextFieldStyle {
    
    //枚举名 _ 类型
    XXTextFieldStyle_none  = 0,
    XXTextFieldStyle_border,
    XXTextFieldStyle_line,
    
} XXTextFieldStyle;

@interface UITextField (XXTextField)

@property (strong, nonatomic) UIColor *xx_borderColor ;

- (instancetype )xx_initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder color:(UIColor *)color;

- (instancetype )xx_initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius style:(XXTextFieldStyle)style;


@end

NS_ASSUME_NONNULL_END
