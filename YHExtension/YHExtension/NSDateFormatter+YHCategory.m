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

#import "NSDateFormatter+YHCategory.h"

@implementation NSDateFormatter (YHCategory)

+ (id)dateFormatter
{
    return [[self alloc] init];
}

+ (id)dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (id)defaultDateFormatter
{
    return [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)getyyyy_MM_ddWithTimeInterval:(NSTimeInterval)timeInterval
{
    NSDateFormatter *dateFormatter = [self dateFormatterWithFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
}
@end
