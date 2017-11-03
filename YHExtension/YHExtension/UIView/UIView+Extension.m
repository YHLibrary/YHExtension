//
//  UIView+Extension.m
//  CDL
//
//  Created by 王英辉 on 16/3/10.
//  Copyright © 2016年 book. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

// 返回最上层控制器
- (UIViewController*)topViewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
