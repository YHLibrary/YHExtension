//
//  UIViewController+Extension.h
//  CDL
//
//  Created by 王英辉 on 16/3/10.
//  Copyright © 2016年 book. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

/**
 *  显示警告框
 *
 *  @param style       类型
 *  @param title       标题
 *  @param content     内容
 *  @param btnTitles   确认按钮选项数组
 *  @param okBlock     确认回调
 *  @param cancelBlock 取消回调
 */
- (void)showAlertWiteType:(UIAlertControllerStyle)style Title:(NSString *)title content:(NSString *)content okBtnTitles:(NSArray *)btnTitles ok:(void (^)(NSInteger index))okBlock cancel:(void (^) ())cancelBlock;


- (void)showAlertWiteType:(UIAlertControllerStyle)style Title:(NSString *)title content:(NSString *)content okBtnTitles:(NSArray *)btnTitles cancelTitle:(NSString *)cancelTitle ok:(void (^)(NSInteger index))okBlock cancel:(void (^)())cancelBlock;
@end
