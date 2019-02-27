//
//  UIViewController+XXViewController.m
//  zhong
//
//  Created by GMS_XiaoXin on 17/4/30.
//  Copyright © 2017年 GMS_001. All rights reserved.
//

#import "UIViewController+XXViewController.h"

@implementation UIViewController (XXViewController)

// push animated 默认YES
- (void)xx_pushVC:(UIViewController *)vc
{
    NSLog(@"%@",self.navigationController);
    if (self.navigationController)
    {
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
// push animated 可选
- (void)xx_pushVC:(UIViewController *)vc animated:(BOOL)animated
{
    if (self.navigationController)
    {
        vc.hidesBottomBarWhenPushed = animated;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
// pop animated 默认YES
- (void)xx_pop
{
    if (self.navigationController)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
// pop animated 可选
- (void)xx_popAnimated:(BOOL)animated
{
    if (self.navigationController)
    {
        [self.navigationController popViewControllerAnimated:animated];
    }
}
// pop animated 默认YES
- (void)xx_popVC:(UIViewController *)vc
{
    if (self.navigationController)
    {
        [self.navigationController popToViewController:vc animated:YES];
    }
}
// pop animated 可选
- (void)xx_popVC:(UIViewController *)vc animated:(BOOL)animated
{
    if (self.navigationController)
    {
        [self.navigationController popToViewController:vc animated:animated];
    }
}
/**
 通过sb获取控制器
 
 @param identifier id
 
 @return 控制器
 */
- (__kindof UIViewController *)xx_getSbWithIdentifier:(NSString *)identifier
{
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:identifier];
    return vc;
}
/**
 通过sb获取控制器
 
 @param sbName sbName
 @param identifier id
 
 @return 控制器
 */
- (UIViewController *)xx_getSb:(NSString *)sbName identifier:(NSString *)identifier
{
    UIViewController *vc = [[UIStoryboard storyboardWithName:sbName bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:identifier];
    return vc;
}

@end
