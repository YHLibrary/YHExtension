//
//  UIBarButtonItem+MJ.h
//  新浪微博
//
//  Created by apple on 13-10-27.
//  Copyright (c). All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIBarButtonItem (MJ)
- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted title:(NSString *)title tag:(NSInteger)tag target:(id)target action:(SEL)action;
+ (id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted title:(NSString *)title tag:(NSInteger)tag target:(id)target action:(SEL)action;
@end
