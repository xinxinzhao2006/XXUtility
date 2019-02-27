//
//  UIView+MSJIBInspectable.h
//  Stone
//
//  Created by 陈嘉鸿 on 17/5/10.
//  Copyright © 2017年 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MSJIBInspectable)

@property (assign, nonatomic) IBInspectable NSInteger cornerRadius;
@property (assign, nonatomic) IBInspectable NSInteger borderWidth;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;

@end
