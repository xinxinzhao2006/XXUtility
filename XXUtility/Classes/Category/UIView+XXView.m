




//
//  UIView+XXView.m
//  BaseTest
//
//  Created by GMS_XiaoXin on 17/2/15.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import "UIView+XXView.h"
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>

#define k_w [UIScreen mainScreen].bounds.size.width
#define k_h [UIScreen mainScreen].bounds.size.height
#define kImgViewBgColor [UIColor colorWithRed:(((0xdddddd & 0xFF0000) >> 16))/255.0 green:(((0xdddddd &0xFF00) >>8))/255.0 blue:((0xdddddd &0xFF))/255.0 alpha:1.0]
#define kViewTapForbiddenTime 1.0

typedef NS_ENUM(NSInteger, EdgeType) {
    TopBorder = 10000,
    LeftBorder = 20000,
    BottomBorder = 30000,
    RightBorder = 40000
};

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;
static char kActionHandlerLongPressBlockKey;
static char kActionHandlerLongPressGestureKey;

@implementation UIView (XXView)

// 画线默认颜色
- (instancetype)xx_initLineFrame:(CGRect)frame
{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    // 配置背景颜色
    line.backgroundColor = kImgViewBgColor;
    return line;
}
// 画线 自定义颜色
- (instancetype)xx_initLineFrame:(CGRect)frame color:(UIColor *)color
{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    // 配置背景颜色
    line.backgroundColor = color;
    return line;
}

/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)screenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    if( [self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
    {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    }
    else
    {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

/**
 max_x + 间隙
 
 @param space 间隙
 
 @return 值
 */
- (CGFloat)xx_max_x_offset:(CGFloat)space
{
    CGFloat x = self.frame.origin.x+self.frame.size.width+space;
    
    if (x > 0)
    {
        return x;
    }
    else
    {
        return 0;
    }
}
/**
 max_y + 间隙
 
 @param space 间隙
 
 @return 值
 */
- (CGFloat)xx_max_y_offset:(CGFloat)space
{
    CGFloat y = self.frame.origin.y+self.frame.size.height+space;
    
    if (y > 0)
    {
        return y;
    }
    else
    {
        return 0;
    }
}
/**
 x + 间隙
 
 @param space 间隙
 
 @return 值
 */
- (CGFloat)xx_x_offset:(CGFloat)space
{
    CGFloat x = self.frame.origin.x+space;
    
    if (x > 0)
    {
        return x;
    }
    else
    {
        return 0;
    }
}
/**
 y + 间隙
 
 @param space 间隙
 
 @return 值
 */
- (CGFloat)xx_y_offset:(CGFloat)space
{
    CGFloat y = self.frame.origin.y+space;
    
    if (y > 0)
    {
        return y;
    }
    else
    {
        return 0;
    }
}
- (void)xx_cornerRadius:(CGFloat)radius RectCorner:(UIRectCorner)Corner
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:Corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
/**
 *  @brief  找到当前view所在的viewcontroler
 */
- (UIViewController *)xx_vc
{
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}


/**
 设置一个view的某一个边框线
 
 @param view 当前view
 @param top 上
 @param left 左
 @param bottom 下
 @param right 右
 @param color 颜色
 @param width 宽度
 */
- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, CGRectGetMaxY(view.frame));
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, CGRectGetMaxY(view.frame));
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}



- (void)xx_removeTopBorder {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == TopBorder) {
            [subView removeFromSuperview];
        }
    }];
}

- (void)xx_removeLeftBorder {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == LeftBorder) {
            [subView removeFromSuperview];
        }
    }];
}

- (void)xx_removeBottomBorder {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == BottomBorder) {
            [subView removeFromSuperview];
        }
    }];
}

- (void)xx_removeRightBorder {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == RightBorder) {
            [subView removeFromSuperview];
        }
    }];
}

- (void)xx_addTopBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    [self addTopBorderWithColor:color width:borderWidth excludePoint:0 edgeType:0];
}


- (void)xx_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    [self addLeftBorderWithColor:color width:borderWidth excludePoint:0 edgeType:0];
}


- (void)xx_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth {
    [self addBottomBorderWithColor:color width:borderWidth excludePoint:0 edgeType:0];
}


- (void)xx_addRightBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    [self addRightBorderWithColor:color width:borderWidth excludePoint:0 edgeType:0];
}


- (void)addTopBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(ExcludePoint)edge {
    [self xx_removeTopBorder];
    
    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = TopBorder;
    
    [self addSubview:border];
    
    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (edge & ExcludeStartPoint) {
        startPoint += point;
    }
    
    if (edge & ExcludeEndPoint) {
        endPoint += point;
    }
    
    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLenght = self.bounds.size.width - endPoint - startPoint;
        border.frame = CGRectMake(startPoint, 0.0, borderLenght, borderWidth);
        return;
    }
    
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
}


- (void)addLeftBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(ExcludePoint)edge {
    [self xx_removeLeftBorder];
    
    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = LeftBorder;
    [self addSubview:border];
    
    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (edge & ExcludeStartPoint) {
        startPoint += point;
    }
    
    if (edge & ExcludeEndPoint) {
        endPoint += point;
    }
    
    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLength = self.bounds.size.height - startPoint - endPoint;
        border.frame = CGRectMake(0.0, startPoint, borderWidth, borderLength);
        return;
    }
    
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
    
}


- (void)addBottomBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(ExcludePoint)edge {
    [self xx_removeBottomBorder];
    
    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = BottomBorder;
    [self addSubview:border];
    
    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (edge & ExcludeStartPoint) {
        startPoint += point;
    }
    
    if (edge & ExcludeEndPoint) {
        endPoint += point;
    }
    
    
    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLength = self.bounds.size.width - startPoint - endPoint;
        border.frame = CGRectMake(startPoint, self.bounds.size.height - borderWidth, borderLength, borderWidth);
        return;
    }
    
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
}

- (void)addRightBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(ExcludePoint)edge {
    [self xx_removeRightBorder];
    
    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = RightBorder;
    [self addSubview:border];
    
    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (edge & ExcludeStartPoint) {
        startPoint += point;
    }
    
    if (edge & ExcludeEndPoint) {
        endPoint += point;
    }
    
    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLength = self.bounds.size.height - startPoint - endPoint;
        border.frame = CGRectMake(self.bounds.size.width - borderWidth, startPoint, borderWidth, borderLength);
        return;
    }
    
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
}
/**
 设置边框 宽 颜色
 
 @param w     宽度
 @param color 颜色
 */
- (void)xx_setBorder:(CGFloat )w andColor:(UIColor*)color
{
    self.xx_borderWidth = w;
    self.xx_borderColor = color;
}
/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)xx_addTapActionWithBlock:(GestureActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}
/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)xx_addLongPressActionWithBlock:(GestureActionBlock)block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        // 限制连续点击
        self.userInteractionEnabled = NO;
        [NSTimer scheduledTimerWithTimeInterval:kViewTapForbiddenTime target:self selector:@selector(viewEnable:) userInfo:nil repeats:NO];
        
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerLongPressBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}
// 打开用户交互
- (void)viewEnable:(NSTimer *)sender
{
    self.userInteractionEnabled = YES;
    [sender invalidate];
}
/**
 设置背景图片
 
 @param img 图片
 */
-(void)xx_setBgImg:(UIImage *)img
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.bounds];
    imgView.image = img;
    [self addSubview:imgView];
    [self sendSubviewToBack:imgView];
}
/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)xx_screenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    if( [self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
    {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    }
    else
    {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}
#pragma mark - 位置大小

- (BOOL)xx_masksToBounds
{
    return self.layer.masksToBounds;
}
- (void)setXx_masksToBounds:(BOOL)xx_masksToBounds
{
    self.layer.masksToBounds = xx_masksToBounds;
}
- (CGFloat )xx_borderWidth
{
    return  self.layer.borderWidth;
}
- (void)setXx_borderWidth:(CGFloat)xx_borderWidth
{
    self.layer.borderWidth = xx_borderWidth;
}
- (UIColor *)xx_borderColor
{
    return  [UIColor colorWithCGColor:self.layer.borderColor];
}
- (void)setXx_borderColor:(UIColor *)xx_borderColor
{
    self.layer.borderColor = xx_borderColor.CGColor;
}
- (CGFloat)xx_cornerRadius
{
    self.layer.masksToBounds = YES;
    return self.layer.cornerRadius;
}
- (void)setXx_cornerRadius:(CGFloat)xx_cornerRadius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = xx_cornerRadius;
}
- (CGFloat)xx_x
{
    return  self.frame.origin.x;
}
- (void)setXx_x:(CGFloat)xx_x
{
    CGRect frme = self.frame;
    frme.origin.x = xx_x;
    self.frame = frme;
}
- (CGFloat)xx_y
{
    return  self.frame.origin.y;
}
- (void)setXx_y:(CGFloat)xx_y
{
    CGRect frme = self.frame;
    frme.origin.y = xx_y;
    self.frame = frme;
}
- (CGFloat)xx_width
{
    return  self.bounds.size.width;
}
- (void)setXx_width:(CGFloat)xx_width
{
    CGRect frme = self.frame;
    frme.size.width = xx_width;
    self.frame = frme;
}
- (CGFloat)xx_height
{
    return self.bounds.size.height;
}
- (void)setXx_height:(CGFloat)xx_height
{
    CGRect frme = self.frame;
    frme.size.height = xx_height;
    self.frame = frme;
}
- (CGFloat)xx_max_x
{
    return  self.frame.origin.x + self.bounds.size.width;
}
- (void)setXx_max_x:(CGFloat)xx_max_x
{}
- (CGFloat)xx_max_y
{
    return  self.frame.origin.y + self.bounds.size.height;
}
- (void)setXx_max_y:(CGFloat)xx_max_y
{}
- (CGPoint)xx_origin {
    return self.frame.origin;
}

- (void)setXx_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)xx_size {
    return self.frame.size;
}

- (void)setXx_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)xx_centerX {
    return self.center.x;
}

- (void)setXx_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)xx_centerY {
    return self.center.y;
}

- (void)setXx_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


@end
