//
//  MBProgressHUD+MJ.h
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MJ)

+ (void)showWithLable:(NSString *)text detailsLabel:(NSString *)detailsLabel icon:(NSString *)icon view:(UIView *)view;

+ (void)showWithLable:(NSString *)text view:(UIView *)view;

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showSuccessWithLabel:(NSString *)label detailsLabel:(NSString *)detailsLabel toView:(UIView *)view;

+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showErrorWithLabel:(NSString *)label detailsLabel:(NSString *)detailsLabel toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
