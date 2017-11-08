//
//  UIImage+YHExtension.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YHExtension)


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


/**
 分解gif图片为image数组

 @param imageName 图片名字
 @return UImage对象数组
 */
+ (NSArray *)getImagesWithImageName:(NSString *)imageName;


/**
 获得屏幕截图

 @param viewToCapture 要截取的视图
 @return 截取生成的UImage对象
 */
+(UIImage *)captureScreen:(UIView *)viewToCapture;

@end
