//
//  NSString+attributedString.m
//  zhagen
//
//  Created by 王英辉 on 15/6/15.
//  Copyright (c) 2015年 BDog. All rights reserved.
//

#import "NSAttributedString+YHAttributedString.h"

@implementation NSAttributedString (YHAttributedString)

/**
 * 字符串变属性字符串
 */
+ (NSAttributedString *)getSttributedStringWithString:(NSString *)string
{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineHeightMultiple = 50.f;
    paragraphStyle.maximumLineHeight = 30.f;
    paragraphStyle.minimumLineHeight = 15.f;
    //    paragraphStyle.firstLineHeadIndent = 20.f;
    paragraphStyle.alignment = NSTextAlignmentJustified;
    
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:17], NSParagraphStyleAttributeName:paragraphStyle, NSForegroundColorAttributeName:[UIColor colorWithRed:76./255. green:75./255. blue:71./255. alpha:1]
                                  };
    return [[NSAttributedString alloc]initWithString:string attributes:attributes];
}

+ (NSAttributedString *)getTitleSttributedStringWithString:(NSString *)string
{
    
    NSString *pattern = @"[\\u4e00-\\u9fa5]+\\:";
    
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    // 2.测试字符串
    NSArray *results = [regex matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    // 3.遍历结果
//    for (NSTextCheckingResult *result in results) {
//        NSLog(@"%@ %@", NSStringFromRange(result.range), [string substringWithRange:result.range]);
//    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:((NSTextCheckingResult *)results[0]).range];
    
    return attributedString;
}

+ (CGFloat)getAttributedStringHeight:(NSString *)string width:(CGFloat)width
{
    NSAttributedString *atrS = [self getSttributedStringWithString:string];
    
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [atrS boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                     options:options
                                     context:nil];
  return rect.size.height;
}
@end
