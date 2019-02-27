//
//  UITableView+XXTableView.h
//  YJBestBusiness
//
//  Created by Aranion on 2018/1/25.
//  Copyright © 2018年 YJBest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (XXTableView)

// 注册nib
-(void)xx_registerNib:(NSString *)nibName identifier:(NSString *)identifier;
// 刷新行
- (void)xx_reloadRows:(NSArray *)arr;
// 刷新组
- (void)xx_reloadSections:(NSArray *)sections;
// 获得cell
- (__kindof UITableViewCell *)xx_cellForIndexPath:(NSIndexPath *)indexPath;

@end
