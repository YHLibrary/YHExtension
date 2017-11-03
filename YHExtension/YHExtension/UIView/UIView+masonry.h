//
//  UIView+masonry.h
//  1108-MasonryTest
//
//  Created by 王英辉 on 15/11/9.
//  Copyright © 2015年 book. All rights reserved.
//

// 5. [高级] 横向或者纵向等间隙的排列一组view

#import <UIKit/UIKit.h>

@interface UIView (masonry)

// 水平等距离布局
- (void) distributeSpacingHorizontallyWith:(NSArray*)views;

// 垂直等距离布局
- (void) distributeSpacingVerticallyWith:(NSArray*)views;

@end
