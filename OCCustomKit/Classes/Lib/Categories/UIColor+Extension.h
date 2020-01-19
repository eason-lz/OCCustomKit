//
//  UIColor+Extension.h
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

//--------------------------------------------------- Color func
// 0 ~ 255
#define Color(r, g, b, a) [UIColor colorWithR:(r) G:(g) B:(b) A:(a)]
// hex
#define ColorHex(v) [UIColor colorWithHex:(v)]
// random
#define ColorRandom(alpha) [UIColor colorRandom:(alpha)]

// 0 ~ 255
+ (instancetype)colorWithR:(CGFloat) r G:(CGFloat) g B:(CGFloat) b A:(CGFloat)a;

// Hex
+ (instancetype)colorWithHex:(int)rgba;

// random color
+ (instancetype)colorRandom:(CGFloat)alpha;

+ (UIImage *)imageWithColour:(UIColor *)colour;
+ (UIImage *)imageWithColour:(UIColor *)colour size:(CGSize)size;
@end
