//
//  MBProgressHUD+Extension.h
//  bestbuy
//
//  Created by eason on 2017/5/18.
//  Copyright © 2017年 eason. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Extension)

/**
 *  显示提示 (view为nil, 表示添加掉Window上, 该HUD自动隐藏)
 */
+ (nonnull MBProgressHUD *)showPromptMsg:(nonnull NSString *)msg toView:(nullable UIView *)view;

/**
 *  显示成功 (view为nil, 表示添加掉Window上, 该HUD自动隐藏)
 */
+ (nonnull MBProgressHUD *)showSuccessMsg:(nonnull NSString *)msg toView:(nullable UIView *)view;

/**
 *  显示失败 (view为nil, 表示添加掉Window上, 该HUD自动隐藏)
 */
+ (nonnull MBProgressHUD *)showFailureMsg:(nonnull NSString *)msg toView:(nullable UIView *)view;

/**
 *  显示菊花 (view为nil, 表示添加掉Window上)
 */
+ (nonnull MBProgressHUD *)showActivityInView:(nullable UIView *)view;

/**
 *  隐藏HUD (view为nil, 表示移除Window上的view)
 */
+ (void)hide:(nullable UIView *)view animated:(BOOL)animated;

@end
