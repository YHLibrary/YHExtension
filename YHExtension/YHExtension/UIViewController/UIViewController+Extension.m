//
//  UIViewController+Extension.m
//  CDL
//
//  Created by 王英辉 on 16/3/10.
//  Copyright © 2016年 book. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (void)showAlertWiteType:(UIAlertControllerStyle)style Title:(NSString *)title content:(NSString *)content okBtnTitles:(NSArray *)btnTitles ok:(void (^)(NSInteger index))okBlock cancel:(void (^) ())cancelBlock
{
    [self showAlertWiteType:style Title:title content:content okBtnTitles:btnTitles cancelTitle:@"取消" ok:okBlock cancel:cancelBlock];
    
}


- (void)showAlertWiteType:(UIAlertControllerStyle)style Title:(NSString *)title content:(NSString *)content okBtnTitles:(NSArray *)btnTitles cancelTitle:(NSString *)cancelTitle ok:(void (^)(NSInteger index))okBlock cancel:(void (^)())cancelBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:style];
    
    [alert addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }]];
    
    int i = 0;
    for (NSString *btnTitle in btnTitles) {
        [alert addAction:[UIAlertAction actionWithTitle:btnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock(i);
            }
        }]];
        i ++;
    }
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
