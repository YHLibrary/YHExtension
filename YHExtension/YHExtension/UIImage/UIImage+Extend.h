//
//  UIImage+Extend.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)


/**
 *  拉伸图片:自定义比例
 */
+(UIImage *)resizeWithImageName:(NSString *)name leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;

/**
 *  拉伸图片
 */
+(UIImage *)resizeWithImageName:(NSString *)name;

/**
 *  获取启动图片
 */
+(UIImage *)launchImage;

/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param completeBlock 出错回调
 */
-(void)savedPhotosAlbum:(void(^)())completeBlock failBlock:(void(^)())failBlock;

+ (NSArray *)getImagesWithImageName:(NSString *)imageName;

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
