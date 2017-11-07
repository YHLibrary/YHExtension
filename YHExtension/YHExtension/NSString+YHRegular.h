//
//  NSString+chechout.h
//  1226-信息验证
//
//  Created by 王英辉 on 15/12/26.
//  Copyright © 2015年 王英辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YHRegular)

// 手机号验证
- (BOOL)isMobileTelephone;
// 邮箱验证
- (BOOL)isValidateEmail;
// 车牌号验证
- (BOOL)isValidateCarNo;
// 车型
- (BOOL)isValidateCarType;
// 用户名
- (BOOL)isValidateUserName;
// 密码
- (BOOL)isValidatePassword;
// 账户
- (BOOL)isValidateAccount;
// 昵称
- (BOOL)isValidateNickPwd;
// 密码
- (BOOL)isValidatePasswordMinLength:(int)minLength maxLength:(int)maxLength;
// 昵称
- (BOOL)isValidateNickName;
// 身份证号
- (BOOL)isValidateIdentityCard;
// 银行卡
- (BOOL)isValidateBankCardNumber;
// verifyCode
- (BOOL)isValidateVerifyCode;
// QQ
- (BOOL)isValidateQQ;
// 微信
- (BOOL)isValidateWeChat;
// 评论(不能包含特殊符号）
- (BOOL)isTextContent;
// 表情
- (BOOL)stringContainsEmoji;
// 验证推荐人ID
- (BOOL)customMemberSN;
// 代金券验证
- (BOOL)vouchersNmuber;
// 判断是否为汉子
-(BOOL)isChinese;
@end
