//
//  UIColor+Extension.m
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (instancetype)colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b A:(CGFloat)a {
    return [self colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}

+ (instancetype)colorWithHex:(int)rgba {
    return [UIColor colorWithRed:((rgba & 0xFF000000) >> 24) / 255.0f
                           green:((rgba & 0x00FF0000) >> 16) / 255.0f
                            blue:((rgba & 0x0000FF00) >> 8) / 255.0f
                           alpha:(rgba & 0x000000FF) / 255.0f];
}

+ (instancetype)colorRandom:(CGFloat)alpha {
    return [self colorWithR:arc4random_uniform(255) G:arc4random_uniform(255) B:arc4random_uniform(255) A:alpha];
}

+ (UIImage *)imageWithColour:(UIColor *)colour {
    return [UIColor imageWithColour:colour size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColour:(UIColor *)colour size:(CGSize)size {
    // Begin draw context using specified size..
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw context using color..
    CGContextSetFillColorWithColor(context, [colour CGColor]);
    CGContextFillRect(context, rect);
    
    // Get image of image context..
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
