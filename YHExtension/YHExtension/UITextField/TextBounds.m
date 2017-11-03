//
//  TextBounds.m
//  DouFuShop
//
//  Created by doufu on 16/7/20.
//  Copyright © 2016年 王英辉. All rights reserved.
//

#import "TextBounds.h"

@implementation TextBounds

- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect rect = [super textRectForBounds:bounds];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 5, 0,10);
    
    return UIEdgeInsetsInsetRect(rect, insets);
}


- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect rect = [super editingRectForBounds:bounds];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 5, 0, 10);
    return UIEdgeInsetsInsetRect(rect, insets);
}
@end
