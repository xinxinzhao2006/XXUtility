//
//  NSTimer+XXTimer.m
//  XXDataManager
//
//  Created by 小新 on 2018/8/29.
//  Copyright © 2018年 小新. All rights reserved.
//

#import "NSTimer+XXTimer.h"
#import <objc/runtime.h>
static char timerBlockKey ;

@implementation NSTimer (XXTimer)

/**
 定时器
 
 @param interval 时间
 @param repeats 是否循环
 @param block 回调
 @return timer
 */
+ (NSTimer *)xx_timerInterval:(CGFloat)interval repeats:(BOOL)repeats blcok:(XXTimerBlock)block
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(timerAction:) userInfo:nil repeats:repeats];
    
    objc_setAssociatedObject(timer, &timerBlockKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return timer;
}
+(void)timerAction:(NSTimer *)timer
{
    XXTimerBlock block = objc_getAssociatedObject(timer, &timerBlockKey);
    if (block)
    {
        block(timer);
    }
}

@end
