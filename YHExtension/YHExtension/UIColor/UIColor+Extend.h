//
//  UIColor+Extend.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extend)

/**
 *  十六进制颜色
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString;


/**
 *  十六进制颜色:含alpha
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString alpha:(float)alpha;


@end
