//
//  CALayer+IBKeyPath.m
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "CALayer+IBKeyPath.h"

#import <objc/runtime.h>

static void * const KBoardColorFromUIcolor = (void*)&KBoardColorFromUIcolor;
static void * const kShadowColorFromUIcolor = (void*)&kShadowColorFromUIcolor;

@implementation CALayer (IBKeyPath)

- (void)setBoardColorFromUIcolor:(UIColor *)boardColorFromUIcolor
{
    objc_setAssociatedObject(self, &KBoardColorFromUIcolor, boardColorFromUIcolor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //将UIColor转成CGColor后设置给borderColor
    self.borderColor = boardColorFromUIcolor.CGColor;
}

- (UIColor *)boardColorFromUIcolor
{
    return objc_getAssociatedObject(self, &KBoardColorFromUIcolor);
}

- (void)setShadowColorFromUIcolor:(UIColor *)shadowColorFromUIcolor
{
    objc_setAssociatedObject(self, &kShadowColorFromUIcolor, shadowColorFromUIcolor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //将UIColor转成CGColor后设置给shadowColor
    self.shadowColor = shadowColorFromUIcolor.CGColor;
}

- (UIColor *)shadowColorFromUIcolor
{
    return objc_getAssociatedObject(self, &kShadowColorFromUIcolor);
}

@end
