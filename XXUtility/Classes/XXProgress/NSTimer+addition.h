//
//  NSTimer+addition.h
//  TGWebViewController
//
//  Created by XX on 2017/9/19.
//  Copyright © 2017年 QR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (addition)

/** 暂停时间 */
- (void)xx_pauseTime;
/** 获取内容所在当前时间 */
- (void)xx_webPageTime;
/** 当前时间 time 秒后的时间 */
- (void)xx_webPageTimeWithTimeInterval:(NSTimeInterval)time;

@end
