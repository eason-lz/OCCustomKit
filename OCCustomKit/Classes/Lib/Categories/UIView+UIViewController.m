//
//  UIView+UIViewController.m
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UIView+UIViewController.h"

@implementation UIView (UIViewController)

- (UIViewController *)firstAvailableUIViewController
{
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (id)traverseResponderChainForUIViewController
{
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        return nextResponder;
    }
    else if ([nextResponder isKindOfClass:[UIView class]])
    {
        return [nextResponder traverseResponderChainForUIViewController];
    }
    else
    {
        return nil;
    }
}

- (UINavigationController *)firstAvailableNavigationController
{
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UINavigationController class]])
    {
        return nextResponder;
    }
    else if ([nextResponder isKindOfClass:[UIView class]])
    {
        return [nextResponder firstAvailableNavigationController];
    }
    else
    {
        return nil;
    }
}

- (BOOL)pushViewController:(UIViewController *)controller animated:(BOOL)animated
{
    UIViewController *aController = [self firstAvailableUIViewController];
    if (aController)
    {
        UINavigationController *navigationController = aController.navigationController;
        if (navigationController)
        {
            [navigationController pushViewController:controller animated:animated];
        }
        else
        {
            [controller presentViewController:controller animated:animated completion:^{
                
            }];
        }
        return YES;
    }
    return NO;
}

@end
