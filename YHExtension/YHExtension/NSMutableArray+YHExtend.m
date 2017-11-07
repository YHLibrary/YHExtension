//
//  NSMutableArray+Extend.m
//  DouFuShop
//
//  Created by 王英辉 on 2016/10/10.
//  Copyright © 2016年 王英辉. All rights reserved.
//

#import "NSMutableArray+YHExtend.h"

@implementation NSMutableArray (YHExtend)


- (NSMutableArray *)insertObject:(id)object index:(NSInteger)index
{
    if ([self containsObject:object]) {
        [self removeObject:object];
    }
    [self insertObject:object atIndex:index];
    return self;
}


// 删除NSArray中的NSNull
- (NSMutableArray *)removeNullFromArray:(NSArray *)arr
{
    NSMutableArray *marr = [NSMutableArray array];
    for (int i = 0; i < arr.count; i++) {
        NSValue *value = arr[i];
        // 删除NSDictionary中的NSNull，再添加进数组
        if ([value isKindOfClass:NSDictionary.class]) {
            [marr addObject:[self removeNullFromDictionary:(NSDictionary *)value]];
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
- (NSMutableDictionary *)removeNullFromDictionary:(NSDictionary *)dic
{
    NSMutableDictionary *mdic = [NSMutableDictionary dictionary];
    for (NSString *strKey in dic.allKeys) {
        NSValue *value = dic[strKey];
        // 删除NSDictionary中的NSNull，再保存进字典
        if ([value isKindOfClass:NSDictionary.class]) {
            mdic[strKey] = [self removeNullFromDictionary:(NSDictionary *)value];
        }
        // 删除NSArray中的NSNull，再保存进字典
        else if ([value isKindOfClass:NSArray.class]) {
            mdic[strKey] = [self removeNullFromArray:(NSArray *)value];
        }
        // 剩余的非NSNull类型的数据保存进字典
        else if (![value isKindOfClass:NSNull.class]) {
            mdic[strKey] = dic[strKey];
        }
    }
    return mdic;
}
@end
