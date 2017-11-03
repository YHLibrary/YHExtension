/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

/**
 *  显示提示视图
 *
 *  @param view 所在view
 *  @param hint 提示内容
 */
- (void)showHudInView:(UIView *)view hint:(NSString *)hint;
/**
 *  隐藏提示
 */
- (void)hideHud;
/**
 *  显示提示
 *
 *  @param hint 提示内容    
 */
- (void)showHint:(NSString *)hint;

// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;

@end
