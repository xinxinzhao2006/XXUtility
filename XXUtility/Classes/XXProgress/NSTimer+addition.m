//
//  NSTimer+addition.m
//  TGWebViewController
//
//  Created by XX on 2017/9/19.
//  Copyright © 2017年 QR. All rights reserved.
//

#import "NSTimer+addition.h"

@implementation NSTimer (addition)

- (void)xx_pauseTime{
    //判断定时器是否有效
    if (!self.isValid)  {
        return;
    }
    //停止计时器
    [self  setFireDate:[NSDate distantFuture]];
}
- (void)xx_webPageTime{
    //判断定时器是否有效
    if (!self.isValid)  {
        return;
    }
    //返回当期时间
    [self setFireDate:[NSDate date]];
}
- (void)xx_webPageTimeWithTimeInterval:(NSTimeInterval)time{
    //判断定时器是否有效
    if (!self.isValid)  {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:time]];
}

@end
