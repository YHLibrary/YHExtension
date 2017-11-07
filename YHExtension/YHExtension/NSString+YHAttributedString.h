//
//  NSString+AttributedString.h
//  CDL
//
//  Created by 王英辉 on 16/3/8.
//  Copyright © 2016年 book. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (YHAttributedString)

/**
 * 获得带删除线的属性字符串
 */
- (NSAttributedString *)strikethroughWithFont:(UIFont *)font color:(UIColor *)color;
/**
 * 获得设置好的属性字符串
 */
- (NSAttributedString *)attributedStringWithFont:(UIFont *)font color:(UIColor *)color range:(NSRange)range;
@end
