//
//  UIFont+Extension.m
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)

+ (nonnull instancetype)lig:(CGFloat)size {
    return [self systemFontOfSize:size weight:UIFontWeightLight];
}

+ (nonnull instancetype)reg:(CGFloat)size {
    return [self systemFontOfSize:size weight:UIFontWeightRegular];
}

+ (nonnull instancetype)med:(CGFloat)size {
    return [self systemFontOfSize:size weight:UIFontWeightMedium];
}

@end
