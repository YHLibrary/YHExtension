//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+MJ.h"

@implementation MBProgressHUD (MJ)
#pragma mark 显示信息
+ (void)showWithLable:(NSString *)text detailsLabel:(NSString *)detailsLabel icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationFade;
    hud.labelText = text;
    hud.opacity = 0.8;
    hud.cornerRadius = 3;
    hud.userInteractionEnabled = NO;
    hud.labelFont = [UIFont systemFontOfSize:16];
    hud.margin = 8;
    hud.minSize = CGSizeMake(100, 100);
    hud.detailsLabelText = detailsLabel;
    
    hud.detailsLabelFont = [UIFont systemFontOfSize:14];
    
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];

    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:2];
}

#pragma mark 显示信息
+ (void)showWithLable:(NSString *)text view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationFade;
    hud.labelText = text;
    hud.opacity = 0.8;
    hud.cornerRadius = 3;
    hud.labelFont = [UIFont systemFontOfSize:14];
    hud.margin = 8;
    hud.detailsLabelFont = [UIFont systemFontOfSize:14];
    
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:2];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self showWithLable:nil detailsLabel:error icon:@"error.png" view:view];
}
+ (void)showErrorWithLabel:(NSString *)label detailsLabel:(NSString *)detailsLabel toView:(UIView *)view
{
    [self showWithLable:label detailsLabel:detailsLabel icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
     [self showWithLable:nil detailsLabel:success icon:@"success.png" view:view];
}

+ (void)showSuccessWithLabel:(NSString *)label detailsLabel:(NSString *)detailsLabel  toView:(UIView *)view
{
    [self showWithLable:label detailsLabel:detailsLabel icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationFade;
    hud.labelText = message;
    hud.opacity = 0.8;
    hud.cornerRadius = 3;
    hud.labelFont = [UIFont systemFontOfSize:14];
    hud.minSize = CGSizeMake(100, 100);
    hud.margin = 8;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccessWithLabel:success detailsLabel:nil toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
@end
