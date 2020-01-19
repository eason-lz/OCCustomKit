//
//  NSString+Desensitization.m
//  OC_FM
//
//  Created by eason on 2018/11/28.
//  Copyright © 2018 eason. All rights reserved.
//

#import "NSString+Desensitization.h"

@implementation NSString (Desensitization)

/**
 格式化输出银行卡号
 @param mask 需要掩码的位置, 掩码以'*'号输出
 */
- (NSString *)bankNumberFormatWithMask:(NSStringBankNumberMask)mask {
    
    NSMutableString *str = [self mutableCopy];
    NSInteger maskCount = 4;
    NSInteger maskLength = 4;
    if (str.length >= maskCount * maskLength) {
        
        if (mask & NSStringBankNumberMaskD) {
            [str replaceCharactersInRange:NSMakeRange(3*maskLength, maskLength) withString:@"****"];
        }
        [str insertString:@" " atIndex:3 * maskLength];
        
        if (mask & NSStringBankNumberMaskC) {
            [str replaceCharactersInRange:NSMakeRange(2*maskLength, maskLength) withString:@"****"];
        }
        [str insertString:@" " atIndex:2 * maskLength];
        
        if (mask & NSStringBankNumberMaskB) {
            [str replaceCharactersInRange:NSMakeRange(1*maskLength, maskLength) withString:@"****"];
        }
        [str insertString:@" " atIndex:1 * maskLength];
        
        if (mask & NSStringBankNumberMaskA) {
            [str replaceCharactersInRange:NSMakeRange(0*maskLength, maskLength) withString:@"****"];
        }
    }
    
    return str;
}

/**
 格式化输出身份证
 @param mask 需要掩码的位置, 掩码以'*'号输出
 */
- (NSString *)idNumberFormatWithMask:(NSStringIdNumberMask)mask {
    NSMutableString *str = [self mutableCopy];
    NSInteger maskLength = 4;
    if (str.length >= 6+maskLength+maskLength) {
        if (mask & NSStringIdNumberMaskB) {
            [str replaceCharactersInRange:NSMakeRange(6+maskLength, maskLength) withString:@"****"];
        }
        if (mask & NSStringIdNumberMaskA) {
            [str replaceCharactersInRange:NSMakeRange(6, maskLength) withString:@"****"];
        }
    }
    return str;
}

/**
 格式化输出名字
 @param mask 需要掩码的位置, 掩码以'*'号输出
 */
- (NSString *)nameFormatWithMask:(NSStringNameMask)mask {
    NSMutableString *str = [self mutableCopy];
    if (str.length >= 2) {
        if (mask & NSStringNameMaskB) {
            NSString * pointStr = @"";
            for (int i = 0; i < str.length-1; i++) {
                pointStr = [pointStr stringByAppendingString:@"*"];
            }
            [str replaceCharactersInRange:NSMakeRange(1, str.length-1) withString:pointStr];
        }
        if (mask & NSStringNameMaskA) {
            [str replaceCharactersInRange:NSMakeRange(0, 1) withString:@"*"];
        }
    }
    return str;
}

@end
