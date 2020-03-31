
//
//  UILabel+XXLabel.m
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/2/20.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import "UILabel+XXLabel.h"

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
        return 0;
    }
    if (self.textAlignment == NSTextAlignmentCenter)
    {
        return 1;
    }
    if (self.textAlignment == NSTextAlignmentRight)
    {
        return 2;
    }
    
    return self.textAlignment;
}
- (void)setXx_alignment:(NSInteger)xx_alignment
{
    
    switch (xx_alignment)
    {
        case 0:
            self.textAlignment = NSTextAlignmentLeft;
            break;
        case 1:
            self.textAlignment = NSTextAlignmentCenter;
            break;
        case 2:
            self.textAlignment = NSTextAlignmentRight;
            break;
            
        default:
            break;
    }
}

@end
