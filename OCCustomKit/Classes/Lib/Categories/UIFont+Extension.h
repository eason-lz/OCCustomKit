//
//  UIFont+Extension.h
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Font(v) [UIFont systemFontOfSize:(v)]
#define FontLig(v) [UIFont lig:(v)]
#define FontReg(v) [UIFont reg:(v)]
#define FontMed(v) [UIFont med:(v)]

@interface UIFont (Extension)

/**
 *  Light
 */
+ (nonnull instancetype)lig:(CGFloat)size;

/**
 *  Regular
 */
+ (nonnull instancetype)reg:(CGFloat)size;

/**
 *  Medium
 */
+ (nonnull instancetype)med:(CGFloat)size;

@end
