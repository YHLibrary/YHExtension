//
//  NSDictionary+Exten.m
//  DouFuShop
//
//  Created by 王英辉 on 2016/12/6.
//  Copyright © 2016年 王英辉. All rights reserved.
//

#import "NSDictionary+YHUtil.h"

@implementation NSDictionary (YHUtil)

// 删除NSArray中的NSNull
- (NSMutableArray *)removeNullFromArray:(NSArray *)arr
{
    NSMutableArray *marr = [NSMutableArray array];
    for (int i = 0; i < arr.count; i++) {
        NSValue *value = arr[i];
        // 删除NSDictionary中的NSNull，再添加进数组
        if ([value isKindOfClass:NSDictionary.class]) {
            [marr addObject:[(NSDictionary *)value removeNull]];
        }
        // 删除NSArray中的NSNull，再添加进数组
        else if ([value isKindOfClass:NSArray.class]) {
            [marr addObject:[self removeNullFromArray:(NSArray *)value]];
        }
        // 剩余的非NSNull类型的数据添加进数组
        else if (![value isKindOfClass:NSNull.class]) {
            [marr addObject:value];
        }
    }
    return marr;
}

// 删除Dictionary中的NSNull
- (NSMutableDictionary *)removeNull
{
    NSMutableDictionary *mdic = [NSMutableDictionary dictionary];
    for (NSString *strKey in self.allKeys) {
        NSValue *value = self[strKey];
        // 删除NSDictionary中的NSNull，再保存进字典
        if ([value isKindOfClass:NSDictionary.class]) {
            mdic[strKey] = [(NSDictionary *)value removeNull];
        }
        // 删除NSArray中的NSNull，再保存进字典
        else if ([value isKindOfClass:NSArray.class]) {
            mdic[strKey] = [self removeNullFromArray:(NSArray *)value];
        }
        // 剩余的非NSNull类型的数据保存进字典
        else if (![value isKindOfClass:NSNull.class]) {
            mdic[strKey] = self[strKey];
        }
    }
    return mdic;
}

@end
