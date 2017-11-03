//
//  NSDictionary+Exten.h
//  DouFuShop
//
//  Created by 王英辉 on 2016/12/6.
//  Copyright © 2016年 王英辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Exten)

// 删除Dictionary中的NSNull
- (NSMutableDictionary *)removeNull;

@end
