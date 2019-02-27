//
//  AR_Keychain.h
//  利用钥匙串创建UUID实现设备识别
//
//  Created by Aranion on 16/2/16.
//  Copyright © 2016年 wulong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <security/security.h>

@interface AR_Keychain : NSObject

// 生成并保存 UUID
+ (void)save:(NSString *)service data:(id)data;
// 读取 UUID
+ (id)load:(NSString *)service;
// 删除 UUID
+ (void)delete:(NSString *)service;

@end
