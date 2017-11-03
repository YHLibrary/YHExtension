//
//  UIBarButtonItem+GA.h
//  WeMeetig
//
//  Created by 1 on 14-11-25.
//  Copyright (c) 2014年 jianan.hou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,zwlSxe)
{
    zwlSexMan,
    zwlSxeWoman
};
@interface UIBarButtonItem (GA)
@property(nonatomic,assign,readonly)zwlSxe *sex;
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon andTitle:(NSString*)title target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon andTitle:(NSString*)title andTitleFontSize:(int)size target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
+(UIButton *)itemWithBtn:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
@end
