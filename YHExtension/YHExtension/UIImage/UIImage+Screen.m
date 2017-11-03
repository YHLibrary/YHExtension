//
//  UIImage+Screen.m
//  DouFuShop
//
//  Created by doufu on 2017/1/4.
//  Copyright © 2017年 王英辉. All rights reserved.
//

#import "UIImage+Screen.h"

@implementation UIImage (Screen)

+(UIImage *)captureScreen:(UIView *)viewToCapture
{
    UIGraphicsBeginImageContext(viewToCapture.bounds.size);//模糊
    [viewToCapture.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

//UIGraphicsBeginImageContext(viewToCapture.bounds.size);//模糊
//UIGraphicsBeginImageContextWithOptions(viewToCapture.bounds.size, NO, 0.0);//原图

@end
