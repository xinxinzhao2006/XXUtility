//
//  UITableView+XXTableView.m
//  YJBestBusiness
//
//  Created by Aranion on 2018/1/25.
//  Copyright © 2018年 YJBest. All rights reserved.
//

#import "UITableView+XXTableView.h"

@implementation UITableView (XXTableView)

/**
 注册nib
 
 @param nibName    名称
 @param identifier id
 */
-(void)xx_registerNib:(NSString *)nibName identifier:(NSString *)identifier
{
    UINib *nib = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

- (void)xx_reloadRows:(NSArray *)arr
{
    [self reloadRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationNone];
}
- (void)xx_reloadSections:(NSArray *)sections
{
    for (NSNumber *num in sections)
    {
        [self reloadSections:[NSIndexSet indexSetWithIndex:[num integerValue]] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}
// 获得cell
- (__kindof UITableViewCell *)xx_cellForIndexPath:(NSIndexPath *)indexPath
{
    return [self cellForRowAtIndexPath:indexPath];
}
@end
