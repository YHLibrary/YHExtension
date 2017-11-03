//
//  UIBarButtonItem+MJ.m
//  新浪微博
//
//  Created by apple on 13-10-27.
//  Copyright (c). All rights reserved.
//

#import "UIBarButtonItem+MJ.h"
#import "MJTitleButton.h"
@implementation UIBarButtonItem (MJ)
- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted title:(NSString *)title tag:(NSInteger)tag target:(id)target action:(SEL)action
{
    // 创建按钮
    MJTitleButton *btn = [MJTitleButton buttonWithType:UIButtonTypeCustom];
    
    btn.tag = tag;
    
    // 设置普通背景图片
    UIImage *image = [UIImage imageNamed:icon];
    
    [btn setImage:image forState:UIControlStateNormal];
    
    
    MyLog(@"%@",title);
    //设置普通标题
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 设置高亮图片
    [btn setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    
    // 设置尺寸
//    btn.bounds = (CGRect){CGPointZero, image.size};
    btn.bounds = CGRectMake(0, 0, 100, 40);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self initWithCustomView:btn];
}

+ (id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted title:(NSString *)title tag:(NSInteger)tag target:(id)target action:(SEL)action
{
    return [[self alloc] initWithIcon:icon highlightedIcon:highlighted title:(NSString *)title tag:(NSInteger)tag target:target action:action];
}
@end
