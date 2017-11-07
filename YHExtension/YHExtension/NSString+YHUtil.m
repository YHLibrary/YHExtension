//
//  NSString+Extend.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import "NSString+YHUtil.h"

@implementation NSString (YHUtil)
/*
 *  时间戳对应的NSDate
 */
-(NSDate *)date{
    
    NSTimeInterval timeInterval=self.floatValue;
    
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

- (NSDictionary *)getUrlStrParamDict
{
    NSDictionary *(^getUrlStrParamDict)(NSString *url) = ^(NSString *url) {
        
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
        NSArray *param0Array = [url componentsSeparatedByString:@"?"];
        NSString *urlStr = param0Array.lastObject;
        
        if (urlStr.length > 0) {
            NSArray *param1Array = [urlStr componentsSeparatedByString:@"&"];
            
            for (NSString *param1 in param1Array) {
                NSArray *param2Array = [param1 componentsSeparatedByString:@"="];
                if(param2Array.count >= 2){
                    dict[param2Array[0]] = param2Array[1];
                }
                
            }
        }
        
        
        return dict;
    };

    
    return getUrlStrParamDict(self);
}

+(NSString *)escape:(NSString *)str
{
    NSArray *hex = [NSArray arrayWithObjects:
                    @"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"0A",@"0B",@"0C",@"0D",@"0E",@"0F",
                    @"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"1A",@"1B",@"1C",@"1D",@"1E",@"1F",
                    @"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"2A",@"2B",@"2C",@"2D",@"2E",@"2F",
                    @"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"3A",@"3B",@"3C",@"3D",@"3E",@"3F",
                    @"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"4A",@"4B",@"4C",@"4D",@"4E",@"4F",
                    @"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"5A",@"5B",@"5C",@"5D",@"5E",@"5F",
                    @"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69",@"6A",@"6B",@"6C",@"6D",@"6E",@"6F",
                    @"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"79",@"7A",@"7B",@"7C",@"7D",@"7E",@"7F",
                    @"80",@"81",@"82",@"83",@"84",@"85",@"86",@"87",@"88",@"89",@"8A",@"8B",@"8C",@"8D",@"8E",@"8F",
                    @"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"99",@"9A",@"9B",@"9C",@"9D",@"9E",@"9F",
                    @"A0",@"A1",@"A2",@"A3",@"A4",@"A5",@"A6",@"A7",@"A8",@"A9",@"AA",@"AB",@"AC",@"AD",@"AE",@"AF",
                    @"B0",@"B1",@"B2",@"B3",@"B4",@"B5",@"B6",@"B7",@"B8",@"B9",@"BA",@"BB",@"BC",@"BD",@"BE",@"BF",
                    @"C0",@"C1",@"C2",@"C3",@"C4",@"C5",@"C6",@"C7",@"C8",@"C9",@"CA",@"CB",@"CC",@"CD",@"CE",@"CF",
                    @"D0",@"D1",@"D2",@"D3",@"D4",@"D5",@"D6",@"D7",@"D8",@"D9",@"DA",@"DB",@"DC",@"DD",@"DE",@"DF",
                    @"E0",@"E1",@"E2",@"E3",@"E4",@"E5",@"E6",@"E7",@"E8",@"E9",@"EA",@"EB",@"EC",@"ED",@"EE",@"EF",
                    @"F0",@"F1",@"F2",@"F3",@"F4",@"F5",@"F6",@"F7",@"F8",@"F9",@"FA",@"FB",@"FC",@"FD",@"FE",@"FF", nil];
    
    NSMutableString *result = [NSMutableString stringWithString:@""];
    int strLength = str.length;
    for (int i=0; i<strLength; i++) {
        int ch = [str characterAtIndex:i];
        if (ch == ' ')
        {
            [result appendFormat:@"%C",'+'];
        }
        else if ('A' <= ch && ch <= 'Z')
        {
            [result appendFormat:@"%C",(char)ch];
            
        }
        else if ('a' <= ch && ch <= 'z')
        {
            [result appendFormat:@"%C",(char)ch];
        }
        else if ('0' <= ch && ch<='9')
        {
            [result appendFormat:@"%C",(char)ch];
        }
        else if (ch == '-' || ch == '_'
                 || ch == '.' || ch == '!'
                 || ch == '~' || ch == '*'
                 || ch == '\'' || ch == '('
                 || ch == ')')
        {
            [result appendFormat:@"%C",(char)ch];
        }
        else if (ch <= 0x007F)
        {
            [result appendFormat:@"%%",'%'];
            [result appendString:[hex objectAtIndex:ch]];
        }
        else
        {
            [result appendFormat:@"%%",'%'];
            [result appendFormat:@"%C",'u'];
            [result appendString:[hex objectAtIndex:ch>>8]];
            [result appendString:[hex objectAtIndex:0x00FF & ch]];
        }
    }
    return result;
}

+ (NSString*) unescapeUnicodeString:(NSString*)string
{
    Byte val[] = {
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,
        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F};
    NSMutableString *out = [NSMutableString string];
    if(string && ![string isEqualToString:@""]){
        int i = 0;
        int len = [string length];
        while (i < len) {
            unichar ch = [string characterAtIndex:i];
            if (ch == '+') {
                [out appendString:@"' '"];
            } else if ('A' <= ch && ch <= 'Z') {
                [out appendString:[NSString stringWithFormat:@"%C",ch]];
            } else if ('a' <= ch && ch <= 'z') {
                [out appendString:[NSString stringWithFormat:@"%C",ch]];
            } else if ('0' <= ch && ch <= '9') {
                [out appendString:[NSString stringWithFormat:@"%C",ch]];
            } else if (ch == '-' || ch == '_'
                       || ch == '.' || ch == '!'
                       || ch == '~' || ch == '*'
                       || ch == '\'' || ch == '('
                       || ch == ')') {
                [out appendString:[NSString stringWithFormat:@"%C",ch]];
            } else if (ch == '%') {
                unichar cint = 0;
                if ('u' != [string characterAtIndex:i+1]) {
                    cint = (cint << 4) | val[[string characterAtIndex:i+1]];
                    cint = (cint << 4) | val[[string characterAtIndex:i+2]];
                    i+=2;
                } else {
                    cint = (cint << 4) | val[[string characterAtIndex:i+2]];
                    cint = (cint << 4) | val[[string characterAtIndex:i+3]];
                    cint = (cint << 4) | val[[string characterAtIndex:i+4]];
                    cint = (cint << 4) | val[[string characterAtIndex:i+5]];
                    i+=5;
                }
                [out appendString:[NSString stringWithFormat:@"%C",cint]];
            }
            i++;
        }
    }
    
//    out = [[out stringByReplacingOccurrencesOfString:@"%u" withString:@"\\U"] mutableCopy];
    
//    for (int i = 0 ; i < out.length; i += 6) {
//        [out deleteCharactersInRange:NSMakeRange(i, 1)];
//    }
    
    
//    NSString *TempString = @"sevensoft os good";
    
//    char css[100];
//    
//    memcpy(css, [out cStringUsingEncoding:NSASCIIStringEncoding], 2*[out length]);
//    
//    NSLog(@"css====%s ",css);
    
    return [NSString stringWithString:out];
}


- (CGSize)getSizeWithfontSize:(UIFont *)font andWidth:(float)width
{
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize retSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;

}

- (NSString *)removeWhitespacAndNewline
{
//    //1. 去除掉首尾的空白字符和换行字符
//    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *str = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return str;
}


@end
