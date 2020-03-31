//
//  UITextField+XXTextField.m
//  XXModule
//
//  Created by yf-zhaonx on 2020/3/26.
//  Copyright © 2020 小新. All rights reserved.
//

#import "UITextField+XXTextField.h"
#import "XXMacro.h"

@implementation UITextField (XXTextField)

- (instancetype )xx_initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder color:(UIColor *)color
{
    UITextField *txt = [[UITextField alloc] initWithFrame:frame];
    if (!placeholder)
    {
        placeholder = @"";
    }
    if (!color)
    {
        color = [UIColor blackColor];
    }
    
    txt.placeholder = placeholder;
    txt.backgroundColor = [UIColor whiteColor];
    txt.textColor = color;
    
    // 左侧空白
    UIView *leftView = [[UIView alloc] initWithFrame:kFrame(0, 0, 10, 10)];
    txt.leftView = leftView;
    txt.leftViewMode = UITextFieldViewModeAlways;
    
    return txt;
}
- (instancetype )xx_initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius style:(XXTextFieldStyle)style
{
    UITextField *txt = [self xx_initWithFrame:frame placeholder:placeholder color:color];
    
    if (style == XXTextFieldStyle_line)
    {
        UIView *line = [[UIView alloc] initWithFrame:kFrame(0, frame.size.height-0.5, frame.size.width, 0.5)];
        line.backgroundColor = kColor_ddd;
        line.tag = 999 ;
        [txt addSubview:line];
    }
    
    if (style == XXTextFieldStyle_border)
    {
        txt.layer.cornerRadius = cornerRadius;
        txt.layer.masksToBounds = YES;
        txt.layer.borderColor = kColor_ddd.CGColor;
        txt.layer.borderWidth = 1;
    }
    
    return txt;
}

- (void)setXx_borderColor:(UIColor *)xx_borderColor
{
    self.layer.borderColor = xx_borderColor.CGColor;
    
    for (UIView *line in self.subviews)
    {
        if (line.tag == 999)
        {
            line.backgroundColor = xx_borderColor;
        }
    }
    
}

@end
