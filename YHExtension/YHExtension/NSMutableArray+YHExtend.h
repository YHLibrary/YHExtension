//
//  NSMutableArray+Extend.h
//  DouFuShop
//
//  Created by 王英辉 on 2016/10/10.
//  Copyright © 2016年 王英辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (YHExtend)

/**
 *  插入去重
 */
-(NSMutableArray *)insertObject:(id)object index:(NSInteger)index;

// 删除NSArray中的NSNull
- (NSMutableArray *)removeNullFromArray:(NSArray *)arr;
@end
