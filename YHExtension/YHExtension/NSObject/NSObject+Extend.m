//
//  NSObject+Address.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import "NSObject+Extend.h"
#import <objc/message.h>


@implementation NSObject (Extend)


#pragma mark  返回任意对象的字符串式的内存地址
-(NSString *)address{
    return [NSString stringWithFormat:@"%p",self];
}




#pragma mark  调用方法
-(void)callSelectorWithSelString:(NSString *)selString paramObj:(id)paramObj{
    
    //转换为sel
    SEL sel=NSSelectorFromString(selString);
    
    if(![self respondsToSelector:sel]) return;
    
    //调用
//    objc_msgSend(self, sel);
    
}





@end
