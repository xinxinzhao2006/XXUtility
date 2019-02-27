//
//  UIButton+XXButton.m
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/2/20.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import "UIButton+XXButton.h"
#import <objc/runtime.h>

#define kBtnForbiddenTime 1.0

static char btnBlockKey ;

static NSString *const kIndicatorViewKey = @"indicatorView";
static NSString *const kButtonTextObjectKey = @"buttonTextObject";

@implementation UIButton (XXButton)
/**
 实例化按钮对象
 
 @param frame        frame
 @param cornerRadius  圆角
 @param title        标题
 
 @return 实例化对象
 */
- (instancetype)xx_initWithFrame:(CGRect)frame andTitle:(NSString *)title cornerRadius:(CGFloat)cornerRadius Block:(TouchedBlock)block
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    if (cornerRadius > 0)
    {
        button.layer.cornerRadius = cornerRadius;
    }
    if (title)
    {
        [button setTitle:title forState:UIControlStateNormal];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor whiteColor] forState:0];
    
    objc_setAssociatedObject(button, &btnBlockKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 监听按钮点击
    [button addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
    //    button.xx_masksToBounds = YES;
    // 水平 对齐方式
    // button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    // 垂直 对齐方式
    // button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    // 内边距  上 左 下 右
    // button.titleEdgeInsets = UIEdgeInsetsMake(0, kScale_W(11), 0, 0);
    
    return button;
    
}
/**
 实例化按钮对象
 
 @param frame        frame
 @param cornerRadius  圆角
 @param img          图片
 @param bgimg        背景图
 
 @return 实例化对象
 */
- (UIButton *)xx_initWithFrame:(CGRect)frame img:(NSString *)img bgImg:(NSString *)bgimg cornerRadius:(CGFloat)cornerRadius Block:(TouchedBlock)block
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    if (cornerRadius > 0)
    {
        button.layer.cornerRadius = cornerRadius;
    }
    if (img)
    {
        [button setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    }
    if (bgimg)
    {
        [button setBackgroundImage:[UIImage imageNamed:bgimg] forState:UIControlStateNormal];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor whiteColor] forState:0];
    objc_setAssociatedObject(button, &btnBlockKey, block, OBJC_ASSOCIATION_COPY);
    // 监听按钮点击
    [button addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    // 水平 对齐方式
    // button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    // 垂直 对齐方式
    // button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    // 内边距  上 左 下 右
    // button.titleEdgeInsets = UIEdgeInsetsMake(0, kScale_W(11), 0, 0);
    
    return button;
    
}
// 点击事件
-(void)actionTouched:(UIButton *)btn
{
    // 限制连续点击
    self.userInteractionEnabled = NO;
    [NSTimer scheduledTimerWithTimeInterval:kBtnForbiddenTime target:self selector:@selector(btnEnable:) userInfo:nil repeats:NO];
    
    TouchedBlock block = objc_getAssociatedObject(btn, &btnBlockKey);
    if (block) {
        block(btn.tag);
    }
}
- (void)btnEnable:(NSTimer *)timer
{
    self.userInteractionEnabled = YES;
    [timer invalidate];
}

- (UIEdgeInsets)xx_touchAreaInsets
{
    return [objc_getAssociatedObject(self, @selector(xx_touchAreaInsets)) UIEdgeInsetsValue];
}
/**
 *  @brief  设置按钮额外热区
 */
- (void)setXx_touchAreaInsets:(UIEdgeInsets)touchAreaInsets
{
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
    objc_setAssociatedObject(self, @selector(xx_touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    UIEdgeInsets touchAreaInsets = self.xx_touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}
#pragma mark - 动画
- (void)xx_showIndicator {
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    [indicator startAnimating];
    
    NSString *currentButtonText = self.titleLabel.text;
    
    objc_setAssociatedObject(self, &kButtonTextObjectKey, currentButtonText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &kIndicatorViewKey, indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTitle:@"" forState:UIControlStateNormal];
    self.enabled = NO;
    [self addSubview:indicator];
    
    
}
- (void)xx_hideIndicator {
    
    NSString *currentButtonText = (NSString *)objc_getAssociatedObject(self, &kButtonTextObjectKey);
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)objc_getAssociatedObject(self, &kIndicatorViewKey);
    
    [indicator removeFromSuperview];
    [self setTitle:currentButtonText forState:UIControlStateNormal];
    self.enabled = YES;
    
}
/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param color 背景颜色
 *  @param state 按钮状态
 */
- (void)xx_setBgColor:(UIColor *)color forState:(UIControlState)state
{
    [self setBackgroundImage:[UIButton imageWithColor:color] forState:state];
}
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)xx_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle{
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,waitTittle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
            
        }
    });
    dispatch_resume(_timer);
    
}

#pragma mark - 图片与标题
- (void)xx_v_imgAndTitle:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing/2), 0.0);
    titleSize = self.titleLabel.frame.size;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing/2), 0.0, 0.0, - titleSize.width);
}

- (void)xx_v_imgAndTitle
{
    const int DEFAULT_SPACING = 6.0f;
    [self xx_v_imgAndTitle:DEFAULT_SPACING];
}

- (void)xx_h_titleAndImg:(CGFloat)spacing
{
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, imageSize.width + spacing/2);
    titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + spacing/2, 0.0, - titleSize.width);
}

- (void)xx_h_titleAndImg
{
    const int DEFAULT_SPACING = 6.0f;
    [self xx_h_titleAndImg:DEFAULT_SPACING];
}

- (void)xx_h_imgAndTitle:(CGFloat)spacing;
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0,  0.0, 0.0,  - spacing/2);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing/2, 0.0, 0.0);
}

- (void)xx_h_imgAndTitle;
{
    const int DEFAULT_SPACING = 6.0f;
    [self xx_h_imgAndTitle:DEFAULT_SPACING];
}


- (void)xx_h_titleAndImgLeft:(CGFloat)spacing
{
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing, 0.0, 0.0);
}

- (void)xx_h_titleAndImgLeft
{
    const int DEFAULT_SPACING = 6.0f;
    [self xx_h_titleAndImgLeft:DEFAULT_SPACING];
}


- (void)xx_h_titleAndImgRight:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, 0.0);
    
    titleSize = self.titleLabel.frame.size;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + imageSize.width + spacing, 0.0, - titleSize.width);
}

- (void)xx_h_titleAndImgRight
{
    const int DEFAULT_SPACING = 6.0f;
    [self xx_h_titleAndImgRight:DEFAULT_SPACING];
}
#pragma mark - 基本属性
- (NSString *)xx_title
{
    if (self.titleLabel.text)
    {
        return self.titleLabel.text;
    }
    return @"";
}
- (void)setXx_title:(NSString *)xx_title
{
    [self setTitle:xx_title forState:UIControlStateNormal];
}
- (UIColor *)xx_titleColor
{
    return  self.titleLabel.textColor;
}
- (void)setXx_titleColor:(UIColor *)xx_titleColor
{
    [self setTitleColor:xx_titleColor forState:UIControlStateNormal];
}
- (NSInteger)xx_alignment
{
    NSInteger alignment = 0;
    if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft)
    {
        alignment = 1;
    }
    if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft)
    {
        alignment = 2;
    }
    if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft)
    {
        alignment = 3;
    }
    
    return alignment;
}
- (void)setXx_alignment:(NSInteger)xx_alignment
{
    if (xx_alignment == 1)
    {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    if (xx_alignment == 2)
    {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    if (xx_alignment == 3)
    {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
}
- (CGFloat)xx_font
{
    return self.titleLabel.font.pointSize;
}
- (void)setXx_font:(CGFloat)xx_font
{
    self.titleLabel.font = [UIFont systemFontOfSize:xx_font];
}
- (UIImage *)xx_img
{
    return self.imageView.image;
}
- (void)setXx_img:(UIImage *)xx_img
{
    [self setImage:xx_img forState:UIControlStateNormal];
}
@end
