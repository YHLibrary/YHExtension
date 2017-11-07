//
//  NSString+Password.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YHCrypto)

/**
 *  32位MD5加密
 */
@property (nonatomic,copy,readonly) NSString *md5;

/**
 *  SHA1加密
 */
@property (nonatomic,copy,readonly) NSString *sha1;

@end
