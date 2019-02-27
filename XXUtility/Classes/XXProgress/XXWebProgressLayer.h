//
//  TGWebProgressLayer.h
//  TGWebViewController
//
//  Created by XX on 2017/9/19.
//  Copyright © 2017年 QR. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface XXWebProgressLayer : CAShapeLayer
/** 开始加载 */
- (void)xx_startLoad;

/** 完成加载 */
- (void)xx_finishedLoadWithError:(NSError *)error;

/** 关闭时间 */
- (void)xx_closeTimer;

//在KVO 计算  实际的读取进度时,调用改方法
- (void)xx_WebViewPathChanged:(CGFloat)estimatedProgress;



@end
