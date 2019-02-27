//
//  XXAuthorState.h
//  AuthorTest
//
//  Created by Aranion on 2018/2/26.
//  Copyright © 2018年 XX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXAuthorState : NSObject

// 查看相机权限
- (NSInteger)getCameraAuthorState;
// 查看定位权限
- (NSInteger)getLocationAuthorState;
// 查看相册权限
- (NSInteger)getLibraryAuthorState;
// 查看麦克风权限
- (NSInteger)getAudioAuthorState;

@end
