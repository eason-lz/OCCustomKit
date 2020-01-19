//
//  NSString+Desensitization.h
//  OC_FM
//
//  Created by eason on 2018/11/28.
//  Copyright © 2018 eason. All rights reserved.
//
//  字符串脱敏

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, NSStringBankNumberMask) {
    NSStringBankNumberMaskA = 1 << 0,
    NSStringBankNumberMaskB = 1 << 1,
    NSStringBankNumberMaskC = 1 << 2,
    NSStringBankNumberMaskD = 1 << 3,
};

typedef NS_OPTIONS(NSUInteger, NSStringIdNumberMask) {
    NSStringIdNumberMaskA = 1 << 0,
    NSStringIdNumberMaskB = 1 << 1,
};

typedef NS_OPTIONS(NSUInteger, NSStringNameMask) {
    NSStringNameMaskA = 1 << 0,
    NSStringNameMaskB = 1 << 1,
};

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Desensitization)

/**
 格式化输出银行卡号
 @param mask 需要掩码的位置, 掩码以'*'号输出
 */
- (NSString *)bankNumberFormatWithMask:(NSStringBankNumberMask)mask;

/**
 格式化输出身份证
 @param mask 需要掩码的位置, 掩码以'*'号输出
 */
- (NSString *)idNumberFormatWithMask:(NSStringIdNumberMask)mask;

/**
 格式化输出名字
 @param mask 需要掩码的位置, 掩码以'*'号输出
 */
- (NSString *)nameFormatWithMask:(NSStringNameMask)mask;

@end

NS_ASSUME_NONNULL_END
