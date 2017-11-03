//
//  UIView+line.m
//  CDL
//
//  Created by 王英辉 on 16/2/29.
//  Copyright © 2016年 book. All rights reserved.
//

#import "UIView+line.h"

@implementation UIView (line)

- (void)drawDottedLineWithContext:(CGContextRef)context startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint lineColor:(UIColor *)color
{
    
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 1);
    
    CGFloat lengths[2] = {2,1};
    
    CGContextSetLineDash(context, 0, lengths, 1); // 画虚线
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    
    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    
    CGContextStrokePath(context);
}
@end
