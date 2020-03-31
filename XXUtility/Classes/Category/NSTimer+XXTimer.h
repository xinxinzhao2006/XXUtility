//
//  NSTimer+XXTimer.h
//  XXDataManager
//
//  Created by 小新 on 2018/8/29.
//  Copyright © 2018年 小新. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^XXTimerBlock)(NSTimer *timer);

@interface NSTimer (XXTimer)

/**
 定时器

 @param interval 时间
 @param repeats 是否循环
 @param block 回调
 @return timer
 */
+ (NSTimer *)xx_timerInterval:(CGFloat)interval repeats:(BOOL)repeats blcok:(XXTimerBlock)block;


@end
