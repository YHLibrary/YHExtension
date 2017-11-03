//
//  UIWindow+Launch.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import "UIWindow+Launch.h"


@implementation UIWindow (Launch)


#pragma mark  主window
+(UIWindow *)appWindow{
    
    UIWindow *window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //显示状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    //状态栏样式
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    //设置背景色
    window.backgroundColor=[UIColor whiteColor];
    
    //成为主窗口
    [window makeKeyAndVisible];
    
    //返回
    return window;
}







@end
