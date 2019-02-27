//
//  XXProgress.m
//  TGWebViewController
//
//  Created by Aranion on 2017/10/10.
//  Copyright © 2017年 QR. All rights reserved.
//

#import "XXProgress.h"
#import "XXWebProgressLayer.h"

// 进度条颜色
#define kLayerColor kColorFromHex(0xf36b1b)

#define W [UIScreen mainScreen].bounds.size.width
#define kColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]
@interface XXProgress()

@property (strong, nonatomic) XXWebProgressLayer *layer ;


@end

@implementation XXProgress

- (instancetype)initWithSuperView:(UIView *)view y:(CGFloat)h
{
    if (self = [super init])
    {
        self.layer = [[XXWebProgressLayer alloc] init];
        self.layer.frame = CGRectMake(0, h, W, 2);
        self.layer.strokeColor = kLayerColor.CGColor;
        [view.layer addSublayer:self.layer];
    }
    
    return self;
}

- (void)start
{
    [self.layer xx_startLoad];
}
- (void)doneProgress
{
     [self.layer xx_finishedLoadWithError:nil];
}
- (void)hiddenProgress
{
     [self.layer removeFromSuperlayer];
}

+(void)showWihtY:(CGFloat)h
{
    XXWebProgressLayer *layer = [[XXWebProgressLayer alloc] init];
    layer.frame = CGRectMake(0, h, W, 2);
    layer.strokeColor = kLayerColor.CGColor;
    
    UIViewController *vc = [self getCurrentVC];
    [vc.view.layer addSublayer:layer];

    [layer xx_startLoad];
}
+(void)doneProgress
{
    UIViewController *vc = [self getCurrentVC];
    NSArray *layers = vc.view.layer.sublayers;
    
    for (id layer in layers)
    {
        if ([layer isKindOfClass:[XXWebProgressLayer class]])
        {
            
            XXWebProgressLayer *progressLayer = layer;
            [progressLayer xx_finishedLoadWithError:nil];
            break;
        }
    }
}
+ (void)hiddenProgress
{
    UIViewController *vc = [self getCurrentVC];
    NSArray *layers = vc.view.layer.sublayers;
    
    for (id layer in layers)
    {
        if ([layer isKindOfClass:[XXWebProgressLayer class]])
        {
            [layer removeFromSuperlayer];
            break;
        }
    }
    
}
//获取当前屏幕显示的ViewController
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    return result;
}

@end
