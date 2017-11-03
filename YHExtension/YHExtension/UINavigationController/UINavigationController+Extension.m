//
//  UINavigationController+Extension.m
//  CDL
//
//  Created by 王英辉 on 15/11/14.
//  Copyright © 2015年 book. All rights reserved.
//
//http://www.jianshu.com/p/6376149a2c4c  截获导航控制器系统返回按钮的点击pop及右滑pop事件

#import "UINavigationController+Extension.h"
#import <objc/runtime.h>

static NSString *const kOriginDelegate = @"kOriginDelegate";
@implementation UINavigationController (Extension)

// 启用的话删掉（+ (void)loads）的‘s'
+ (void)loads
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        {
            SEL originalSelector = @selector(viewDidLoad);
            SEL swizzledSelector = @selector(overwrite_viewDidload);
            
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            }else
            {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
        {
            SEL originalSelector = @selector(navigationBar:shouldPopItem:);
            SEL swizzledSelector = @selector(overwrite_navigationBar:shouldPopItem:);
            
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            }else
            {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }

        }
        {
            SEL originalSelector = @selector(popViewControllerAnimated:);
            SEL swizzledSelector = @selector(overwrite_popViewControllerAnimated:);
            
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            }else
            {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
            
        }
    });
}

#pragma mark - overwrite_viewDidload
- (void)overwrite_viewDidload
{
    [self overwrite_viewDidload];
    
    objc_setAssociatedObject(self, [kOriginDelegate UTF8String], self.interactivePopGestureRecognizer.delegate, OBJC_ASSOCIATION_ASSIGN);
    
//    MyLog(@"%@",self.interactivePopGestureRecognizer.delegate);
    
    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

#pragma mark - overwrite_navigationBar:shouldPopItem
- (BOOL)overwrite_navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    UIViewController *vc = self.topViewController;

    if (item != vc.navigationItem) {
        return YES;
    }
    return [self overwrite_navigationBar:navigationBar shouldPopItem:item];
    return YES;
}

#pragma mark - overwrite_popViewControllerAnimated
- (nullable UIViewController *)overwrite_popViewControllerAnimated:(BOOL)animated
{
    if (self.viewControllers.count > 3) {
        
//        TabBarViewController *tabBarViewController = (TabBarViewController *)self.tabBarController;
        MyLog(@"%@",self.viewControllers);
//        tabBarViewController.hiddenTabBar =  YES;
    }else if(self.viewControllers.count == 2){
//        TabBarViewController *tabBarViewController = (TabBarViewController *)self.tabBarController;
        MyLog(@"%@",self.viewControllers);
//        tabBarViewController.hiddenTabBar = NO;
        
    }
    
    return [self overwrite_popViewControllerAnimated:animated];
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        
        
        id<UIGestureRecognizerDelegate> originDelegate = objc_getAssociatedObject(self, [kOriginDelegate UTF8String]);
        
        return [originDelegate gestureRecognizerShouldBegin:gestureRecognizer];
    }

    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        
        id<UIGestureRecognizerDelegate> originDelegate = objc_getAssociatedObject(self, [kOriginDelegate UTF8String]);
        return [originDelegate gestureRecognizer:gestureRecognizer shouldReceiveTouch:touch];
    }

    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        id<UIGestureRecognizerDelegate> originDelegate = objc_getAssociatedObject(self, [kOriginDelegate UTF8String]);
        return [originDelegate gestureRecognizer:gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:otherGestureRecognizer];
    }
    return YES;

}



/**
 *  设置导航栏透明度
 *
 *  @param alpha
 */
- (void)setNavigationWithColor:(UIColor *)color {
    
    self.navigationBar.barStyle=UIBarStyleDefault;
    self.navigationBar.translucent = YES;
    self.navigationBar.shadowImage=[UIImage new];
    
    [self.navigationBar setBackgroundImage:[self getImageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    
}
#pragma handle image -mark
-(UIImage *)getImageWithColor:(UIColor *)color{
    
    CGSize colorSize=CGSizeMake(1, 1);
    UIGraphicsBeginImageContext(colorSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    
    UIImage *img=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return img;
}

@end
