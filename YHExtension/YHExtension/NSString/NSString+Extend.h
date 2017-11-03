//
//  NSString+Extend.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extend)


/*
 *  时间戳对应的NSDate
 */
@property (nonatomic,strong,readonly) NSDate *date;


/**
 *  获得url后面的参数
 *
 *  @return 参数字典
 */
- (NSDictionary *)getUrlStrParamDict;

/**
 *  escape() 函数可对字符串进行编码，这样就可以在所有的计算机上读取该字符串。
 */
+ (NSString *)escape:(NSString *)str;
/**
 *  可以使用 unescape() 对 escape() 编码的字符串进行解码
 */
+ (NSString*) unescapeUnicodeString:(NSString*)string;

/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param fontSize 字体的大小
 @param andWidth 限制字符串显示区域的宽度
 @result CGSize 区域大小
 */
- (CGSize)getSizeWithfontSize:(UIFont *)font andWidth:(float)width;


/**
 去除掉其它位置的空白字符和换行字符

 @return 返回去除好的字符串
 */
- (NSString *)removeWhitespacAndNewline;


@end
