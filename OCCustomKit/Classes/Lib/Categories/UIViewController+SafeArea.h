//
//  UIViewController+SafeArea.h
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//
//  安全区域的边距

#import <UIKit/UIKit.h>

@interface UIViewController (SafeArea)

/**
 *  安全区域的边距
 */
@property (nonatomic, assign, readonly) UIEdgeInsets safeAreaInsets;

@end
