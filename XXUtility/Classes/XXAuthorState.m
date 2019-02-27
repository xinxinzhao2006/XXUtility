//
//  XXAuthorState.m
//  AuthorTest
//
//  Created by Aranion on 2018/2/26.
//  Copyright © 2018年 XX. All rights reserved.
//

#import "XXAuthorState.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <CoreLocation/CoreLocation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@implementation XXAuthorState

+(instancetype)sharedInstance
{
    static XXAuthorState *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc]init];
    });
    return _manager;
}

// 查看相机权限
- (NSInteger)getCameraAuthorState
{
    // 相机权限状态
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    // 受限制、无权限
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
    {
        NSLog(@"无权限");
        return 1;
    }
    // 未决定
    else if (authStatus == AVAuthorizationStatusNotDetermined)
    {
        NSLog(@"未决定");
        return 0;
        
    }
    // 有权限
    else
    {
        NSLog(@"有权限");
        return 2;
    }
}
// 查看定位权限
- (NSInteger)getLocationAuthorState
{
    // 定位权限状态
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    // 没有权限
    if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted)
    {
        NSLog(@"无权限");
        return 1;
    }
    // 未决定
    else if (status == kCLAuthorizationStatusNotDetermined)
    {
        NSLog(@"未决定");
        return 0;
    }
    else
    {
        NSLog(@"有权限");
        return 2;
    }
}
// 查看相册权限
- (NSInteger)getLibraryAuthorState
{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == kCLAuthorizationStatusRestricted || author ==kCLAuthorizationStatusDenied)
    {
        //无权限
        return 1;
    }
    // 未决定
    else if (author == kCLAuthorizationStatusNotDetermined)
    {
        NSLog(@"未决定");
        return 0;
    }
    else
    {
        NSLog(@"有权限");
        return 2;
    }
}
// 查看麦克风权限
- (NSInteger)getAudioAuthorState
{

    // 麦克风权限状态
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    
    // 受限制、无权限
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
    {
        NSLog(@"无权限");
        return 1;
    }
    // 未决定
    else if (authStatus == AVAuthorizationStatusNotDetermined)
    {
        NSLog(@"未决定");
        return 0;
        
    }
    // 有权限
    else
    {
        NSLog(@"有权限");
        return 2;
    }
}

@end

#if defined (__cplusplus)
extern "C" {
#endif
    
    // 0 未设置  1 无权限  2 有权限
    void _getCameraAuthorState()
    {
        int state = (int)[[XXAuthorState sharedInstance] getCameraAuthorState];
//        UnitySendMessage("BlueCall", "cameraState", state);
    }
    // 0 未设置  1 无权限  2 有权限
    void _getLocationAuthorState()
    {
        int state = (int)[[XXAuthorState sharedInstance] getLocationAuthorState];
//        UnitySendMessage("BlueCall", "locationState", state);
    }
    
#if defined (__cplusplus)
}
#endif

