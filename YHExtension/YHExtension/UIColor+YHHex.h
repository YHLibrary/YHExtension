//
//  UIColor+YH.h
//  YHExtension
//
//  Created by 王英辉 on 2017/11/7.
//  Copyright © 2017年 王英辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YHHex)

/**
 *  十六进制颜色
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString;


/**
 *  十六进制颜色:含alpha
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString alpha:(float)alpha;

@end
