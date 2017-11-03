//
//  UIImage+EditImageSize.h
//  WeMeetig
//
//  Created by 1 on 14-12-2.
//  Copyright (c) 2014年 jianan.hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (EditImageSize)
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

+ (UIImage *)scaleImage:(UIImage *)image toWidth:(int)toWidth toHeight:(int)toHeight;
@end
