//
//  MBProgressHUD+Extension.m
//  bestbuy
//
//  Created by eason on 2017/5/18.
//  Copyright © 2017年 eason. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

@implementation MBProgressHUD (Extension)

/**
 *  显示提示 (view为nil, 表示添加掉Window上, 该HUD自动隐藏)
 */
+ (nonnull MBProgressHUD *)showPromptMsg:(nonnull NSString *)msg toView:(nullable UIView *)view {
    return [self _showIcon:@"icon_submit_prompt" message:msg toView:view];
}

/**
 *  显示成功 (view为nil, 表示添加掉Window上, 该HUD自动隐藏)
 */
+ (nonnull MBProgressHUD *)showSuccessMsg:(nonnull NSString *)msg toView:(nullable UIView *)view {
    return [self _showIcon:@"icon_submit_success" message:msg toView:view];
}

/**
 *  显示失败 (view为nil, 表示添加掉Window上, 该HUD自动隐藏)
 */
+ (nonnull MBProgressHUD *)showFailureMsg:(nonnull NSString *)msg toView:(nullable UIView *)view {
    return [self _showIcon:@"icon_submit_failure" message:msg toView:view];
}

/**
 *  显示菊花 (view为nil, 表示添加掉Window上)
 */
+ (nonnull MBProgressHUD *)showActivityInView:(nullable UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.animationType = MBProgressHUDAnimationFade;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

/**
 *  隐藏HUD (view为nil, 表示移除Window上的view)
 */
+ (void)hide:(nullable UIView *)view animated:(BOOL)animated {
    if (view == nil) view = [UIApplication sharedApplication].delegate.window;
    [MBProgressHUD hideHUDForView:view animated:animated];
}

/** view为nil, 表示添加掉Window上, 该HUD自动隐藏 */
+ (nonnull MBProgressHUD *)_showIcon:(nonnull NSString *)icon message:(nonnull NSString *)message toView:(nullable UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    hud.removeFromSuperViewOnHide = YES;
    
    NSBundle *currentBundle = [NSBundle mainBundle];
    NSInteger scale = [[UIScreen mainScreen] scale];
    NSString *imgName = [NSString stringWithFormat:@"%@@%zdx.png", icon, scale];
    NSString *path = [currentBundle pathForResource:imgName ofType:nil inDirectory:@"Frameworks/OCCustomKit.framework/OCCustomKit.bundle"];
    UIImageView *imageview = [[UIImageView alloc] init];
    imageview.image = [UIImage imageWithContentsOfFile:path];
    
    hud.customView = imageview;
    hud.label.text = message;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.preferredMaxLayoutWidth = 200;
    hud.label.numberOfLines = 0;
    hud.label.font = [UIFont systemFontOfSize:16];
    [hud hideAnimated:YES afterDelay:2];
    return hud;
}


@end
