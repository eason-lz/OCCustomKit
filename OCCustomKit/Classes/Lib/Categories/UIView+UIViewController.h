//
//  UIView+UIViewController.h
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewController)

- (UIViewController *)firstAvailableUIViewController;

//弹出controller
- (BOOL)pushViewController:(UIViewController *)controller animated:(BOOL)animated;

- (UINavigationController *)firstAvailableNavigationController;

@end
