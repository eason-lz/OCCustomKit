//
//  UIViewController+SafeArea.m
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UIViewController+SafeArea.h"

@implementation UIViewController (SafeArea)

/**
 *  安全区域的边距
 */
@dynamic safeAreaInsets;
- (UIEdgeInsets)safeAreaInsets {
    if (@available(iOS 11.0, *)) {
        return self.view.safeAreaInsets;
    } else {
        static UIEdgeInsets _safeAreaInsets = {20, 0, 0, 0};
        return _safeAreaInsets;
    }
}

@end
