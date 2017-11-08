//
//  UINavigationController+Extension.m
//  CDL
//
//  Created by 王英辉 on 15/11/14.
//  Copyright © 2015年 book. All rights reserved.
//
//http://www.jianshu.com/p/6376149a2c4c  截获导航控制器系统返回按钮的点击pop及右滑pop事件

#import "UINavigationController+YHExtension.h"

@implementation UINavigationController (YHExtension)
/**
 *  设置导航栏透明度
 *
 *  @param alpha
 */
- (void)setNavigationWithColor:(UIColor *)color {
    
    self.navigationBar.barStyle=UIBarStyleDefault;
    self.navigationBar.translucent = YES;
    self.navigationBar.shadowImage=[UIImage new];
    
    [self.navigationBar setBackgroundImage:[self getImageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    
}
#pragma handle image -mark
-(UIImage *)getImageWithColor:(UIColor *)color{
    
    CGSize colorSize=CGSizeMake(1, 1);
    UIGraphicsBeginImageContext(colorSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    
    UIImage *img=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return img;
}

@end
