//
//  UITextField+YH.m
//  YHExtension
//
//  Created by 王英辉 on 2017/11/7.
//  Copyright © 2017年 王英辉. All rights reserved.
//

#import "UITextField+YH.h"

@implementation UITextField (YH)
-(void)addLeftViewWithImage:(NSString *)image{
    
    
    // 密码输入框左边图片
    UIImageView *lockIv = [[UIImageView alloc] init];
    
    // 设置尺寸
    CGRect imageBound = self.bounds;
    // 宽度高度一样
    imageBound.size.width = imageBound.size.height;
    lockIv.bounds = imageBound;
    
    // 设置图片
    lockIv.image = [UIImage imageNamed:image];
    
    // 设置图片居中显示
    lockIv.contentMode = UIViewContentModeCenter;
    
    // 添加TextFiled的左边视图
    self.leftView = lockIv;
    
    // 设置TextField左边的总是显示
    self.leftViewMode = UITextFieldViewModeAlways;
}
@end
