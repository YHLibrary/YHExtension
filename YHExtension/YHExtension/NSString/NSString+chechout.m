//
//  NSString+chechout.m
//  1226-信息验证
//
//  Created by 王英辉 on 15/12/26.
//  Copyright © 2015年 王英辉. All rights reserved.
//

#import "NSString+chechout.h"

@implementation NSString (chechout)


- (BOOL)isMobileTelephone
{
    //手机号以13， 15，18， 14，17开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(17[0-9])|(147)|(15[^4,\\D])|(18[0-9]))\\d{8}$";
    //@"^((14[0-9])|(17[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidateCarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:self];
}

- (BOOL)isValidateCarNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:self];
}

- (BOOL)isValidateUserName
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{4,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:self];
    return B;
}

- (BOOL)isValidatePassword
{
    NSString *passWordRegex = @"^[a-zA-Z0-9_]{6,16}";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:self];
}
- (BOOL)isValidateAccount
{
    NSString *accountRegex = @"^[a-zA-Z0-9]{1,11}";
    NSPredicate *accountPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",accountRegex];
    return [accountPredicate evaluateWithObject:self];
}
- (BOOL)isValidateNickPwd

{
    NSString *nicknameRegex = @"[\u4E00-\u9FA5]";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:self];
    
}

- (BOOL)isValidatePasswordMinLength:(int)minLength maxLength:(int)maxLength
{
    NSString *passWordRegex = [NSString stringWithFormat:@"^[a-zA-Z0-9]{%d,%d}+$", minLength, maxLength];
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:self];
}

- (BOOL)isValidateNickName
{
    NSString *nicknameRegex = @"([\u4e00-\u9fa5a-zA-Z]{2,20})(&middot;[\u4e00-\u9fa5a-zA-Z]{2,20})*";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:self];
}

- (BOOL)isValidateIdentityCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL)isValidateBankCardNumber
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{15,20})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:self];
}

- (BOOL)isValidateVerifyCode
{
    BOOL flag;
    if (!(self.length == 6)) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{6})";
    NSPredicate *verifyCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [verifyCodePredicate evaluateWithObject:self];
}

//QQ
- (BOOL)isValidateQQ
{
    BOOL flag;
    if (!(self.length > 0)) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^[1-9]\\d{4,10}$";
    NSPredicate *verifyCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [verifyCodePredicate evaluateWithObject:self];
}

// 微信
- (BOOL)isValidateWeChat
{
    BOOL flag;
    if (!(self.length > 0)) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^[a-zA-Z\\d_]{5,}$";
    NSPredicate *verifyCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [verifyCodePredicate evaluateWithObject:self];
}

// 评论(不能包含特殊符号）
- (BOOL)isTextContent
{
    BOOL flag;
    if (!(self.length > 0)) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^([\u4e00-\u9fa5]|[0-9]|[a-z]|[A-Z]|[.]|[。]|[?]|[？]|[,]|[，]|[“]|[”]|[']|[‘]|[’]|[!]|[！]|[_]|[\"]|[:]|[；]|[;]|[ ]|[\n]){0,1000}$";
    NSPredicate *verifyCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    //手机号以13， 15，18， 14，17开头，八个 \d 数字字符
    
    flag = [verifyCodePredicate evaluateWithObject:self];
    return flag;
}

// 表情
- (BOOL)stringContainsEmoji {
    
    NSLog(@"%@",self);
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     
                     returnValue = YES;

                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue =YES;
             }
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}


- (BOOL)customMemberSN
{
    //
    NSString *phoneRegex = @"^(U|E)\\d{9}$";
    //
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)vouchersNmuber
{
    NSString *regex = @"^[A-Za-z0-9]+$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [phoneTest evaluateWithObject:self];
}

//NSString * regex = @"^[A-Za-z0-9]{9,15}$";
//NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//BOOL isMatch = [pred evaluateWithObject:txtfldPhoneNumber.text];

@end
