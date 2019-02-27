//
//  AR_Keychain.m
//  利用钥匙串创建UUID实现设备识别
//
//  Created by Aranion on 16/2/16.
//  Copyright © 2016年 wulong. All rights reserved.
//

#import "AR_Keychain.h"

@implementation AR_Keychain

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    
    // 新建UUID字典
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

#pragma mark 写入

+ (void)save:(NSString *)service data:(id)data {
    
    // 新建UUID字典
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    // 使用SecItemDelete 删除UUID
    SecItemDelete((CFDictionaryRef)keychainQuery);
    // 将UUID写入字典
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    // 将字典存入Keychain
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

#pragma mark 读取
+ (id)load:(NSString *)service {
    
    id ret = nil;
    // 新建UUID字典
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    // 只返回一个单一属性
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
//        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
//        } @catch (NSException *e) {
//            NSLog(@"Unarchive of %@ failed: %@", service, e);
//        } @finally {
//        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

#pragma mark 删除
+ (void)delete:(NSString *)service {
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

@end
