//
//  UITabBar+XXTabBar.m
//  YJBestBusiness
//
//  Created by Aranion on 2017/9/6.
//  Copyright © 2017年 YJBest. All rights reserved.
//

#import "UITabBar+XXTabBar.h"

#define kItemCount 4

@implementation UITabBar (XXTabBar)

- (void)xx_showBadgeOnItemIndex:(int)index value:(NSString *)value
{
    //移除之前的小红点
    [self xx_removeBadgeOnItemIndex:index];
    
    //新建小红点
    UILabel *badgeView = [[UILabel alloc]init];
    badgeView.layer.masksToBounds = YES;
    badgeView.textColor = [UIColor whiteColor];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 7.5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = self.frame;
    badgeView.text = value;
    badgeView.font = [UIFont systemFontOfSize:10];
    badgeView.textAlignment = NSTextAlignmentCenter;
    
    //确定小红点的位置
    float percentX = (index +0.6) / kItemCount;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 15, 15);//圆形大小为10
    [self addSubview:badgeView];

}
//显示小红点
- (void)xx_showBadgeOnItemIndex:(int)index{
    //移除之前的小红点
    [self xx_removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    float percentX = (index +0.6) / kItemCount;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);//圆形大小为10
    [self addSubview:badgeView];
}
//隐藏小红点
- (void)xx_hideBadgeOnItemIndex:(int)index{
    //移除小红点
    [self xx_removeBadgeOnItemIndex:index];
}
//移除小红点
- (void)xx_removeBadgeOnItemIndex:(int)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}
@end
