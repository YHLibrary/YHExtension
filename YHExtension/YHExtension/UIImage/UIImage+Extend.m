//
//  UIImage+Extend.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import "UIImage+Extend.h"
#import <objc/runtime.h>
#import <ImageIO/ImageIO.h>

static const void *CompleteBlockKey = &CompleteBlockKey;
static const void *FailBlockKey = &FailBlockKey;

@interface UIImage ()

@property (nonatomic,copy)  void(^CompleteBlock)();

@property (nonatomic,copy)  void(^FailBlock)();

@end


@implementation UIImage (Extend)

/**
 *  拉伸图片
 */
#pragma mark  拉伸图片:自定义比例
+(UIImage *)resizeWithImageName:(NSString *)name leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * leftCap topCapHeight:image.size.height * topCap];
}

#pragma mark  拉伸图片
+(UIImage *)resizeWithImageName:(NSString *)name{
    return [self resizeWithImageName:name leftCap:.5f topCap:.5f];
}

/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param completeBlock 出错回调
 */
-(void)savedPhotosAlbum:(void(^)())completeBlock failBlock:(void(^)())failBlock{
    
    UIImageWriteToSavedPhotosAlbum(self, self, @selector(image:didFinishSavingWithError:contextInfo:),NULL);
    
    self.CompleteBlock = completeBlock;
    self.FailBlock = failBlock;
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if(error == nil){
        if(self.CompleteBlock != nil) self.CompleteBlock();
    }else{
        if(self.FailBlock !=nil) self.FailBlock();
    }

}

/*
 *  模拟成员变量
 */
-(void (^)())FailBlock{
    return objc_getAssociatedObject(self, FailBlockKey);
}
-(void)setFailBlock:(void (^)())FailBlock{
    objc_setAssociatedObject(self, FailBlockKey, FailBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void (^)())CompleteBlock{
    return objc_getAssociatedObject(self, CompleteBlockKey);
}

-(void)setCompleteBlock:(void (^)())CompleteBlock{
    objc_setAssociatedObject(self, CompleteBlockKey, CompleteBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSArray *)getImagesWithImageName:(NSString *)imageName
{
    if (imageName.length == 0) {
        return nil;
    }
    CGFloat scale = [UIScreen mainScreen].scale;
    
    if (scale == 2.0f) {
        NSString *retinaPath = [[NSBundle mainBundle] pathForResource:[imageName stringByAppendingString:@"@2x"] ofType:@"gif"];
        
        NSData *data = [NSData dataWithContentsOfFile:retinaPath];
        
        if (data) {
            return [self imagesWithData:data];
        }
        
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"gif"];
        
        data = [NSData dataWithContentsOfFile:path];
        
        if (data) {
            return [self imagesWithData:data];
        }
        
        return nil;
    }else if (scale == 3.0f) {
        NSString *retinaPath = [[NSBundle mainBundle] pathForResource:[imageName stringByAppendingString:@"@3x"] ofType:@"gif"];
        
        NSData *data = [NSData dataWithContentsOfFile:retinaPath];
        
        if (data) {
            return [self imagesWithData:data];
        }
        
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"gif"];
        
        data = [NSData dataWithContentsOfFile:path];
        
        if (data) {
            return [self imagesWithData:data];
        }
        
        return nil;
    }else {
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"gif"];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        if (data) {
            return [self imagesWithData:data];
        }
        
        return nil;
    }
}


+ (NSArray *)imagesWithData:(NSData *)data {
    if (!data) {
        return nil;
    }
    
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
    size_t count = CGImageSourceGetCount(source);
    
    NSMutableArray *images = [NSMutableArray array];

    NSTimeInterval duration = 0.0f;
    
    for (size_t i = 0; i < count; i++) {
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
        
        duration += [self sd_frameDurationAtIndex:i source:source];
        
        [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
        
        CGImageRelease(image);
    }
    
    if (!duration) {
        duration = (1.0f / 10.0f) * count;
    }
    
    CFRelease(source);
    
    return images;
}

+ (float)sd_frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source {
    float frameDuration = 0.1f;
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    if (delayTimeUnclampedProp) {
        frameDuration = [delayTimeUnclampedProp floatValue];
    }
    else {
        
        NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        if (delayTimeProp) {
            frameDuration = [delayTimeProp floatValue];
        }
    }
    
    // Many annoying ads specify a 0 duration to make an image flash as quickly as possible.
    // We follow Firefox's behavior and use a duration of 100 ms for any frames that specify
    // a duration of <= 10 ms. See <rdar://problem/7689300> and <http://webkit.org/b/36082>
    // for more information.
    
    if (frameDuration < 0.011f) {
        frameDuration = 0.100f;
    }
    
    CFRelease(cfFrameProperties);
    return frameDuration;
}

/**
 *  图片剪切为圆形
 *
 *  @param originalImage 原始图片
 *
 *  @return 剪切后的圆形图片
 */
-(UIImage *)roundImage{
    
    //获取size
    CGSize size = [self sizeFromImage:self];
    
    CGRect rect = (CGRect){CGPointZero,size};
    
    //新建一个图片图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //绘制圆形路径
    CGContextAddEllipseInRect(ctx, rect);
    
    //剪裁上下文
    CGContextClip(ctx);
    
    //绘制图片
    [self drawInRect:rect];
    
    //取出图片
    UIImage *roundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束上下文
    UIGraphicsEndImageContext();
    
    return roundImage;
}



-(CGSize)sizeFromImage:(UIImage *)image{
    
    CGSize size = image.size;
    
    CGFloat wh =MIN(size.width, size.height);
    
    return CGSizeMake(wh, wh);
}

/*
 *  直接截屏
 */
+(UIImage *)cutScreen{
    return [self cutFromView:[UIApplication sharedApplication].keyWindow];
}

+(UIImage *)cutFromView:(UIView *)view{
    
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //在新建的图形上下文中渲染view的layer
    [view.layer renderInContext:context];
    
    [[UIColor clearColor] setFill];
    
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}



-(UIImage *)cutWithFrame:(CGRect)frame{
    
    //创建CGImage
    CGImageRef cgimage = CGImageCreateWithImageInRect(self.CGImage, frame);
    
    //创建image
    UIImage *newImage=[UIImage imageWithCGImage:cgimage];
    
    //释放CGImage
    CGImageRelease(cgimage);
    
    return newImage;
}

@end
