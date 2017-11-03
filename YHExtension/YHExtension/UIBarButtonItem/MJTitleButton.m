 //
//  MJTitleButton.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-16.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTitleButton.h"

#import <Availability.h>

@interface MJTitleButton()
@property (nonatomic, strong) UIFont *titleFont;
@end

// initWithCoder  --->  awakeFromNib
@implementation MJTitleButton

/**
 *  当一个对象从xib或者storyboard中加载完毕后,就会调用一次
 */
//- (void)awakeFromNib
//{
//    NSLog(@"awakeFromNib");
////    self.titleFont = [UIFont systemFontOfSize:14];
//}

/**
 *  从文件中解析一个对象的时候就会调用这个方法
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        [self setup];
    }
    return self;
}

/**
 *  通过代码创建控件的时候就会调用
 */
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

/**
 *  初始化
 */
- (void)setup
{
    self.titleFont = [UIFont systemFontOfSize:15];
    
    [self.titleLabel setFont:self.titleFont];
    
    self.titleLabel.textAlignment = UITextLayoutDirectionRight;
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//
//    // 图标居中
//    self.imageView.contentMode = UIViewContentModeCenter;
}


/**
 *  控制器内部label的frame
 *  contentRect : 按钮自己的边框
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if(self.tag == 2)
    {
        CGFloat titleX = 0;
        CGFloat titleY = 0;
        CGFloat titleW = contentRect.size.width/2+25;
        CGFloat titleH = contentRect.size.height;
        
        return CGRectMake(titleX, titleY, titleW, titleH);
    }
    else
    {
        return CGRectZero;
    }
        
    
}

/**
 *  控制器内部imageView的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if(self.tag == 2)
    {
//        CGFloat imageW = contentRect.size.width/2;
        CGFloat imageX = contentRect.size.width/2+30;
        CGFloat imageY = contentRect.size.height/2-3-2;
//        CGFloat imageH = contentRect.size.height;
        
        return CGRectMake(imageX, imageY, 16, 8);
    }
    else
    {
        return CGRectMake(0, 0, 40, 40);
    }
   
}

@end
