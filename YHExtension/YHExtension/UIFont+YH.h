//
//  UIFont+YH.h
//  YHExtension
//
//  Created by 王英辉 on 2017/11/7.
//  Copyright © 2017年 王英辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (YH)

/**
 *  打印并显示所有字体
 */
+(void)showAllFonts;

/**
 *  宋体(字体缺失)
 */
+(UIFont *)songTypefaceFontOfSize:(CGFloat)size;

/**
 *  微软雅黑：正常字体
 */
+(UIFont *)microsoftYaHeiFontOfSize:(CGFloat)size;

/**
 *  微软雅黑：加粗字体(字体缺失)
 */
+(UIFont *)boldMicrosoftYaHeiFontOfSize:(CGFloat)size;

/**
 *  DroidSansFallback
 */
+(UIFont *)customFontNamedDroidSansFallbackWithFontOfSize:(CGFloat)size;

@end
