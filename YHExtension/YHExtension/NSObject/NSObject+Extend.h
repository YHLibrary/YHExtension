//
//  NSObject+Address.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extend)


/**
 *  返回任意对象的字符串式的内存地址
 */
-(NSString *)address;


/**
 *  调用方法
 */
-(void)callSelectorWithSelString:(NSString *)selString paramObj:(id)paramObj;


@end
