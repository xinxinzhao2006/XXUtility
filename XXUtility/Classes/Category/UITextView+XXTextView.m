
//
//  UITextView+XXTextView.m
//  XXDataManager
//
//  Created by 小新 on 2018/8/29.
//  Copyright © 2018年 小新. All rights reserved.
//

#import "UITextView+XXTextView.h"

@implementation UITextView (XXTextView)

/**
 默认字符串
 
 @param placeholdStr 提示文本
 @param placeholdColor 颜色
 */
-(void)xx_setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor
{
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = placeholdStr;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = placeholdColor;
    placeHolderLabel.font = self.font;
    [placeHolderLabel sizeToFit];
    [self addSubview:placeHolderLabel];
    
    /*
     [self setValue:(nullable id) forKey:(nonnull NSString *)]
     ps: KVC键值编码，对UITextView的私有属性进行修改
     */
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}
@end
