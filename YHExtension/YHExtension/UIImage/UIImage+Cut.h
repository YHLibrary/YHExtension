//
//  UIImage+Cut.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//
//  手机屏幕截图，图片指定区域截图：
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Cut)


/*
 *  圆形图片
 */
@property (nonatomic,strong,readonly) UIImage *roundImage;






/**
 *  从给定UIView中截图：UIView转UIImage
 */
+(UIImage *)cutFromView:(UIView *)view;





/**
 *  直接截屏
 */
+(UIImage *)cutScreen;





/**
 *  从给定UIImage和指定Frame截图：
 */
-(UIImage *)cutWithFrame:(CGRect)frame;







@end
