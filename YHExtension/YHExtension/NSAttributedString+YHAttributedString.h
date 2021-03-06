//
//  NSString+attributedString.h
//  zhagen
//
//  Created by 王英辉 on 15/6/15.
//  Copyright (c) 2015年 BDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (YHAttributedString)

+ (NSAttributedString *)getSttributedStringWithString:(NSString *)string;

+ (NSAttributedString *)getTitleSttributedStringWithString:(NSString *)string;

+ (CGFloat)getAttributedStringHeight:(NSString *)string width:(CGFloat)width;
@end
