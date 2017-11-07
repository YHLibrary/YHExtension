//
//  UIView+YH.h
//  YHExtension
//
//  Created by 王英辉 on 2017/11/7.
//  Copyright © 2017年 王英辉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    //上
    UIViewBorderDirectTop=0,
    
    //左
    UIViewBorderDirectLeft,
    
    //下
    UIViewBorderDirectBottom,
    
    //右
    UIViewBorderDirectRight,
    
}UIViewBorderDirect;

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);
@interface UIView (YH)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
-(void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor *)color width:(CGFloat)width;

/**
 *  添加边框:四边
 */
-(void)setBorder:(UIColor *)color width:(CGFloat)width;

/**
 *  批量移除视图
 *
 *  @param views 需要移除的视图数组
 */
+(void)removeViews:(NSArray *)views;

/**
 设置圆角
 
 @param r 圆角值
 */
-(void)setRadius:(CGFloat)r;

/**
 画虚线
 
 @param context 上下文
 @param startPoint 开始点
 @param endPoint 结束点
 @param color 线条颜色
 */
- (void)drawDottedLineWithContext:(CGContextRef)context startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint lineColor:(UIColor *)color;

// 返回最上层控制器
- (UIViewController*)topViewController;
@end
