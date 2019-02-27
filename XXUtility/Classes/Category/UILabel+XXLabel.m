
//
//  UILabel+XXLabel.m
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/2/20.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import "UILabel+XXLabel.h"
#import "XXMacro.h"
#import "UIView+XXView.h"


@implementation UILabel (XXLabel)
/**
 *  创建Label
 *
 *  @param frame frame
 *  @param title 标题
 *  @param font  字体大小
 *
 *  @return Label
 */
- (instancetype)xx_initWithFrame:(CGRect)frame title:(NSString *)title fontSize:(CGFloat )font color:(UIColor *)color;
{
    UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.text =  [NSString stringWithFormat:@"%@",title];
    lbl.font = [UIFont systemFontOfSize:font];
    if (color)
    {
        lbl.textColor = color;
    }
    
    //    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:title];
    //    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //
    //    [paragraphStyle setLineSpacing:8];//调整行间距
    //
    //    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [title length])];
    //    lbl.attributedText = attributedString;
    
    return lbl;
}

- (NSInteger)xx_alignment
{
    if (self.textAlignment == NSTextAlignmentLeft)
    {
        return 1;
    }
    if (self.textAlignment == NSTextAlignmentCenter)
    {
        return 2;
    }
    if (self.textAlignment == NSTextAlignmentRight)
    {
        return 3;
    }
    
    return self.textAlignment;
}
- (void)setXx_alignment:(NSInteger)xx_alignment
{
    
    switch (xx_alignment)
    {
        case 1:
            self.textAlignment = NSTextAlignmentLeft;
            break;
        case 2:
            self.textAlignment = NSTextAlignmentCenter;
            break;
        case 3:
            self.textAlignment = NSTextAlignmentRight;
            break;
            
        default:
            break;
    }
}
/**
 给UILabel设置行间距和字间距
 
 @param str 字符串
 @param font 字体大小
 @param range 范围
 @param color 改变成什么颜色
 @param Spacing 行间距
 */
-(void)xxsetLabelSpacelabelwithValue:(NSString*)str withFont:(UIFont*)font andlineSpacing:(CGFloat)Spacing andRange:(NSRange)range andTextColor:(UIColor *)color{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    
    paraStyle.lineSpacing = Spacing; //设置行间距
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    //设置字间距 NSKernAttributeName:@1.5f
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    
//    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:changeString];
    
    
    
    [attributeStr addAttribute:NSForegroundColorAttributeName
     
                    value:color
     
                    range:range];
    
    
    
    self.attributedText = attributeStr;
    
}



-(CGFloat)xxgetSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width andlineSpacing:(CGFloat)Spacing{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
   
    paraStyle.lineSpacing = Spacing;
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };

    CGSize size = [str boundingRectWithSize:CGSizeMake(width, kScreen_H) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
    
}

/** 设置某段文字的字体、颜色
 *
 *  string                            原文字
 *  rangeStr                          需要设置的文字
 *  NSForegroundColorAttributeName    设置颜色
 *  NSFontAttributeName               设置字体
 */
- (void)attributeWithString:(NSString *)string rangeString:(NSString *)rangeStr font:(UIFont *)font color:(UIColor *)color {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:string];
    //根据指定字符获取range
    NSRange range = [[attributedStr string] rangeOfString:rangeStr];
    //设置颜色
    if (color) {
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    //设置字体
    if (font) {
        [attributedStr addAttribute:NSFontAttributeName value:font range:range];
    }
    [self setAttributedText:attributedStr];
}

@end
