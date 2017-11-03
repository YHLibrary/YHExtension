//
//  UIView+line.h
//  CDL
//
//  Created by 王英辉 on 16/2/29.
//  Copyright © 2016年 book. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (line)

// 画虚线
- (void)drawDottedLineWithContext:(CGContextRef)context startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint lineColor:(UIColor *)color;
@end
