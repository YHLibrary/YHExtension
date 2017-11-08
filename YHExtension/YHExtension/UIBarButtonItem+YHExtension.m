//
//  UIBarButtonItem+Extension.m
//  BWPNavigationController
//
//  Created by BWP on 16/1/5.
//  Copyright © 2016年 BWP. All rights reserved.
//

#import "UIBarButtonItem+YHExtension.h"


@implementation UIBarButtonItem (YHExtension)
/**
 *  创建一个item
 *  
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    // 设置图片
//    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateNormal];
    // 设置尺寸
    CGRect frame = btn.frame;
//    frame.size = btn.currentBackgroundImage.size;
    frame.size = CGSizeMake(44, 44);
    btn.frame = frame;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
